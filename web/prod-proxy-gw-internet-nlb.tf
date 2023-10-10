# Terraform AWS Application Load Balancer (ALB)
module "nlb_proxy_gw" {
  source  = "gitlab.nexdev.net/iac-terraform/aws-alb/aws"
  version = "8.6.1"

  name               = "${local.project}-${var.environment}-nlb-proxy-gw"
  load_balancer_type = "network" #network application
  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
  subnets = [
    data.terraform_remote_state.vpc.outputs.public_subnets[0],
  ]
  internal = var.nlb_proxy_gw
  # Listeners
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "TCP"
      target_group_index = 0
    },
    /*{
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = aws_acm_certificate.certificate.arn
      action_type = "fixed-response"
      fixed_response = {
        content_type = "text/plain"
        message_body = "Fixed Static message - for Root Context"
        status_code  = "200"
      }
    }*/
  ]

  # Target Groups
  target_groups = [
    {
      name                 = "${local.project}-${var.environment}-gw-80"
      backend_protocol     = "TCP"
      backend_port         = 80
      target_type          = "ip" #"ip" instance
      deregistration_delay = 10
      protocol_version     = "HTTP1"
      health_check = {
        protocol            = "TCP"
        healthy_threshold   = 2
        unhealthy_threshold = 2
        interval            = 5
        timeout             = 3
      }
      preserve_client_ip = true
      stickiness = {
        enabled = false
        type    = "source_ip"
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
