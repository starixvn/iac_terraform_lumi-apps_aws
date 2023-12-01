# Terraform AWS Application Load Balancer (ALB)
module "external_nlb" {
  source  = "gitlab.nexdev.net/iac-terraform/aws-alb/aws"
  version = "8.6.1"

  name               = lower("${var.team}-${var.environment}-nlb")
  load_balancer_type = "network"
  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
  subnets = [
    data.terraform_remote_state.vpc.outputs.public_subnets[0],
    data.terraform_remote_state.vpc.outputs.public_subnets[1],
  ]
  internal        = false
  security_groups = [data.terraform_remote_state.vpc.outputs.loadbalancer_sg]
  # HTTP Listeners
  http_tcp_listeners = [
    {
      port               = 10051
      protocol           = "TCP"
      target_group_index = 0
    },
  ]

  # Target Groups
  target_groups = [
    {
      name                 = lower("${var.team}-${var.environment}-nlb-zabbix-srv")
      backend_protocol     = "TCP"
      backend_port         = 10051
      target_type          = "ip" #"ip" instance
      deregistration_delay = 10
      protocol_version     = "HTTP1"
      # Target Group - Targets
      targets = {
        my_zb1 = {
          target_id = "10.6.48.100"
          port      = 10051
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
