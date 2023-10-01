# Define Local Values in Terraform
locals {
  project     = var.project
  team        = var.team
  environment = var.environment
  common_tags = {
    Dept        = "VNTeam"
    Team        = local.team
    Environment = local.environment
  }
}

locals {
  cluster_name = "${var.environment}-eks-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}