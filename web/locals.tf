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

data "aws_ami" "os" {
  for_each = local.allowed_os

  most_recent = true
  owners      = [each.value.owner]
  filter {
    name   = "name"
    values = [each.value.filter]
  }
}
# Define OS
locals {
  allowed_os = {
    "amazon" : { owner : "amazon", filter : "amzn2-ami-hvm*" },
    "suse" : { owner : "amazon", filter : "*suse*" },
    "RHEL" : { owner : "amazon", filter : "*RHEL*" },
    "ubuntu20" : { owner : "amazon", filter : "*ubuntu-focal-20.04-amd64-server-20230328" },
    "ubuntu22" : { owner : "amazon", filter : "*ubuntu-jammy-22.04-amd64-server-20230728" },
    "windows2019" : { owner : "amazon", filter : "Windows_Server-2019-English-Full-Base*" },
    "windows2022" : { owner : "amazon", filter : "Windows_Server-2022-English-Full-Base*" },
  }
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

#################### ROUTE 53
locals {
  # Define NS
  domain_ns_config = flatten([
    for ns_records in var.domain_ns_records : {
      zone_id      = ns_records.zone_id
      name_servers = ns_records.name_servers
      name         = ns_records.name
      type         = ns_records.type
      ttl          = ns_records.ttl
    }
  ])
  # Define A, Alias,...
  domain_record_config = flatten([
    for domain_zone, domain_info_record in var.domain_records : [
      for info_record in domain_info_record : {
        #info_record  = info_record
        domain_zone  = domain_zone
        record_name  = info_record.name
        record_value = info_record.record
        record_ttl   = info_record.ttl
        record_type  = info_record.type
      }
    ]
  ])
}
