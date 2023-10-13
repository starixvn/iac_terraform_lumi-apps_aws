# Terraform AWS Application Load Balancer (ALB)
module "alb_proxy_gw" {
  source  = "gitlab.nexdev.net/iac-terraform/aws-alb/aws"
  version = "8.6.1"

  name               = "${local.project}-${var.environment}-nlb-proxy-gw"
  load_balancer_type = "application" #network application
  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
  subnets = [
    data.terraform_remote_state.vpc.outputs.public_subnets[0],
  ]
  internal = var.nlb_proxy_gw
  # HTTP Listeners
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "TCP"
      target_group_index = 0
    },
  ]

  # HTTPS Listener
  https_listeners = [
    # HTTPS Listener Index = 0 for HTTPS 443
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = data.terraform_remote_state.acm_cert.outputs.aws_acm_certificate_main
      action_type = "fixed-response"
      fixed_response = {
        content_type = "text/plain"
        message_body = "Fixed Static message - for Root Context"
        status_code  = "200"
      }
    }, 
  ]
  
  # Target Groups
  target_groups = [
    {
      name                 = "${local.project}-${var.environment}-gw-80"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "ip" #"ip" instance
      deregistration_delay = 10
      protocol_version     = "HTTP1"
      health_check = {
        protocol            = "HTTP"
        healthy_threshold   = 2
        unhealthy_threshold = 2
        interval            = 5
        timeout             = 3
      }

      # Target Group - Targets
      targets = {
        for server in local.proxy_gw_instances :
        server.instance_name => {
          target_id = module.proxy_gw_linux[server.instance_name].private_ip
          port      = 80
        }
      }
      tags = local.common_tags # Target Group Tags
    },
  ]
}
