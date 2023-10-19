# Define Local Values in Terraform
locals {
  project     = var.project
  environment = var.environment
  team        = var.team
  common_tags = {
    Dept        = "VNTeam"
    Team        = local.team
    ManageBy    = "Terraform"
    Environment = local.environment
  }
}

locals {
  # Define Proxy GW
  proxy_gw_serverconfig = [
    for srv in var.proxy_gw_vm : {
      instance_name = "${srv.application_name}" #-${i}
      instance_type = srv.instance_type
      volume_type   = srv.volume_type
      volume_size   = srv.volume_size
      private_ip    = srv.private_ip
      ami           = srv.ami
    }
  ]
  # Define App
  apps_serverconfig = [
    for srv in var.apps_vm : {
      instance_name = "${srv.application_name}" #-${i}
      instance_type = srv.instance_type
      volume_type   = srv.volume_type
      volume_size   = srv.volume_size
      private_ip    = srv.private_ip
      ami           = srv.ami
    }
  ]
}
// We need to Flatten it before using it
locals {
  proxy_gw_instances = flatten(local.proxy_gw_serverconfig)
  apps_instances     = flatten(local.apps_serverconfig)
}
