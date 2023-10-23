# Define Local Values in Terraform
locals {
  project     = var.project
  environment = var.environment
  team        = var.team
  common_tags = {
    Dept        = "VNTeam"
    Team        = local.team
    ManageBy    = "vnTerraform"
    Environment = local.environment
  }
}

locals {
  cluster_name = lower("${var.team}-${var.environment}-eks") #-${random_string.suffix.result}
  nodegroup1_label = "group1"
  nodegroup2_label = "group_on_demand"
}

resource "random_string" "suffix" {
  length  = 4
  special = false
}