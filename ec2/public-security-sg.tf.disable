# Security Group for Public Load Balancer
module "loadbalancer_sg" {
  source      = "gitlab.nexdev.net/iac-terraform/security-group/aws"
  version     = "5.0.0"

  name = lower("${var.team}-${var.environment}-loadbalancer-sg")
  description = "Security Group with HTTP open for entire Internet (IPv4 CIDR), egress ports are all world open"
  vpc_id = module.vpc.vpc_id
  # Ingress Rules & CIDR Blocks
  ingress_rules = ["http-80-tcp","https-443-tcp", "https-8443-tcp"]
  ingress_cidr_blocks = var.ingress_cidr_blocks
  # Egress Rule - all-all open
  egress_rules = ["all-all"]
  tags = merge(
    local.common_tags,
    {
      Resource = "loadbalancer_sg"
    },
  )

  # Open to CIDRs blocks (rule or from_port+to_port+protocol+description)
  ingress_with_cidr_blocks = [
    {
      from_port   = 22222
      to_port     = 22222
      protocol    = 6
      description = "Allow Whitelist"
      cidr_blocks = var.allow_whitelist
    },
    {
      from_port   = 9000
      to_port     = 9001
      protocol    = 6
      description = "Allow Whitelist"
      cidr_blocks = var.allow_whitelist
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = 6
      description = "Allow Whitelist"
      cidr_blocks = var.allow_whitelist
    },
  ]
}
