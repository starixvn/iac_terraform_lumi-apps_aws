# Terraform AWS Application Load Balancer (ALB)
module "internal_proxy_gw" {
  source  = "gitlab.nexdev.net/iac-terraform/aws-alb/aws"
  version = "8.6.1"
  name               = lower("${var.team}-${var.environment}-nlb-proxy-gw")
  load_balancer_type = "network"
  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
  subnets = [
    data.terraform_remote_state.vpc.outputs.public_subnets[0],
  ]
  internal = true
  # Listeners
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "TCP"
      target_group_index = 0
    },
  ]

  # Target Groups
  target_groups = [
    {
      name                 = lower("${var.team}-${var.environment}-gw-80")
      backend_protocol     = "TCP"
      backend_port         = 80
      target_type          = "ip" #"ip" instance alb
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
          target_id = server.private_ip
          port      = 80
        }
      }
      tags = local.common_tags # Target Group Tags
    },
    {
      name                 = lower("${var.team}-${var.environment}-gw-80")
      backend_protocol     = "TCP"
      backend_port         = 80
      target_type          = "ip"
      health_check = {
        protocol            = "TCP"
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
    }
  ]
  tags = merge(
          local.common_tags,
          {
            Resource = "LB"
          },
        )
}
