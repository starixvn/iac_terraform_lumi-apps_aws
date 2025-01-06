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

#################### S3-CDN
