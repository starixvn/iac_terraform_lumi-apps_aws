# Terraform AWS Application Load Balancer (ALB)
module "alb_proxy_gw" {
  source  = "gitlab.nexdev.net/iac-terraform/aws-alb/aws"
  version = "8.6.1"

  name               = "${local.project}-${var.environment}-alb-int"
  load_balancer_type = "application" #network application
  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
  subnets = [
    data.terraform_remote_state.vpc.outputs.public_subnets[0],
    data.terraform_remote_state.vpc.outputs.public_subnets[1],
  ]
  internal = true
  security_groups = [data.terraform_remote_state.vpc.outputs.loadbalancer_sg]
  # HTTP Listeners
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    },
  ]

  # Target Groups
  target_groups = [
    {
      name                 = "${local.project}-${var.environment}-gw-alb-80"
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
