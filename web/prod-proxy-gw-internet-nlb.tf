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
  ]

  # Target Groups
  target_groups = [
    # App1 Target Group - TG Index = 0
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
      /*
      health_check {
        protocol = "TCP"
        matcher = ""
        path = ""
      }
      */
      preserve_client_ip   = true
      stickiness = {
        enabled = true
        type    = "source_ip"
      }
      # App1 Target Group - Targets
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
