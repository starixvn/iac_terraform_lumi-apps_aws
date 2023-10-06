# Define Local Values in Terraform
locals {
  project     = var.project
  environment = var.environment
  team = var.team
  common_tags = {
    Dept        = "VNTeam"
    Team        = local.team
    ManageBy = "Terraform"
    Environment = local.environment
  }
}

locals {
  cluster_name = "${var.environment}-${var.team}-eks" #-${random_string.suffix.result}
}

resource "random_string" "suffix" {
  length  = 4
  special = false
}