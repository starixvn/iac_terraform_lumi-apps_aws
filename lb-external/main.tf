# Terraform AWS Application Load Balancer (ALB)
module "external_proxy_gw" {
  source  = "gitlab.nexdev.net/iac-terraform/aws-alb/aws"
  version = "8.6.1"

  name               = lower("${var.team}-${var.environment}-alb-proxy-gw")
  load_balancer_type = "application"
  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
  subnets = [
    data.terraform_remote_state.vpc.outputs.public_subnets[0],
    data.terraform_remote_state.vpc.outputs.public_subnets[1],
  ]
  internal        = false
  security_groups = [data.terraform_remote_state.sg.outputs.public_web_sg]
  # HTTP Listeners
  http_tcp_listeners = [
    {
      port        = 80
      protocol    = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    },
    {
      port               = 22222
      protocol           = "HTTP"
      target_group_index = 1
    },
    {
      port               = 9001
      protocol           = "HTTP"
      target_group_index = 2
    },
  ]

  # HTTPS Listener
  https_listeners = [
    # HTTPS Listener Index = 0 for HTTPS 443
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = data.terraform_remote_state.acm_cert.outputs.aws_acm_certificate_main
      target_group_index = 0
    },
    {
      port            = 8443
      protocol        = "HTTPS"
      certificate_arn = data.terraform_remote_state.acm_cert.outputs.aws_acm_certificate_staging
      action_type     = "fixed-response"
      fixed_response = {
        content_type = "text/plain"
        message_body = "Fixed Static message - for Root Context"
        status_code  = "200"
      }
    },
    {
      port               = 8080
      protocol           = "HTTPS"
      certificate_arn    = data.terraform_remote_state.acm_cert.outputs.aws_acm_certificate_main
      target_group_index = 3
    },
  ]
  extra_ssl_certs = [
    {
      https_listener_index = 0
      certificate_arn      = data.terraform_remote_state.acm_cert.outputs.aws_acm_certificate_staging
    }
  ]
  # Target Groups
  target_groups = [
    {
      name                 = lower("${var.team}-${var.environment}-gw-alb-80")
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "ip" #"ip" instance
      deregistration_delay = 10
      protocol_version     = "HTTP1"
      health_check = {
        protocol            = "HTTP"
        path                = "/checkstatus"
        healthy_threshold   = 2
        unhealthy_threshold = 2
        interval            = 5
        timeout             = 3
      }

      # Target Group - Targets
      targets = {
        for server in local.proxy_gw_instances :
        server.instance_name => {
          target_id = server.private_ip
          port      = 80
        }
      }
    },
    {
      name                 = lower("${var.team}-${var.environment}-gw-deployapi")
      backend_protocol     = "HTTP"
      backend_port         = 22222
      target_type          = "ip" #"ip" instance
      deregistration_delay = 10
      protocol_version     = "HTTP1"
      health_check = {
        protocol            = "HTTP"
        path                = "/"
        matcher             = "200-399"
        healthy_threshold   = 2
        unhealthy_threshold = 2
        interval            = 5
        timeout             = 3
      }
      # Target Group - Targets
      targets = {
        for server in local.apps_instances :
        server.instance_name => {
          target_id = server.private_ip
          port      = 22222
        }
      }
    },
    {
      name                 = lower("${var.team}-${var.environment}-gw-portainer")
      backend_protocol     = "HTTP"
      backend_port         = 9001
      target_type          = "ip" #"ip" instance
      deregistration_delay = 10
      protocol_version     = "HTTP1"
      health_check = {
        protocol            = "HTTP"
        matcher             = "200-399"
        path                = "/"
        healthy_threshold   = 2
        unhealthy_threshold = 2
        interval            = 5
        timeout             = 3
      }
      # Target Group - Targets
      targets = {
        for server in local.apps_instances :
        server.instance_name => {
          target_id = server.private_ip
          port      = 9001
        }
      }
    },
    {
      name                 = lower("${var.team}-${var.environment}-hap-gw-stats")
      backend_protocol     = "HTTP"
      backend_port         = 8080
      target_type          = "ip" #"ip" instance
      deregistration_delay = 10
      protocol_version     = "HTTP1"
      health_check = {
        protocol            = "HTTP"
        matcher             = "200-399"
        path                = "/checkstatus"
        healthy_threshold   = 2
        unhealthy_threshold = 2
        interval            = 5
        timeout             = 3
      }
      # Target Group - Targets
      targets = {
        for server in local.proxy_gw_instances :
        server.instance_name => {
          target_id = server.private_ip
          port      = 8080
        }
      }
    },
  ]
  tags = merge(
    local.common_tags,
    {
      Resource = "LB"
    },
  )
}
