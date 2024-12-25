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
  # Define Alias
  domain_alias_config = flatten([
    for domain_alias_zone, domain_alias_info_record in var.domain_alias_records : [
      for info_alias_record in domain_alias_info_record : {
        domain_zone_alias = domain_alias_zone
        record_name_alias = info_alias_record.name
        record_type_alias = info_alias_record.type
      }
    ]
  ])
  # Define A Record
  domain_a_config = flatten([
    for domain_zone_a, domain_a_info_record in var.domain_a_records : [
      for info_record_a in domain_a_info_record : {
        domain_zone_a  = domain_zone_a
        record_name_a  = info_record_a.name
        record_value_a = info_record_a.record
        record_ttl_a   = info_record_a.ttl
        record_type_a  = info_record_a.type
      }
    ]
  ])
  # Define Cluster Records
  # cluster_records = flatten([
  #   for zone, records in var.cluster_records : [
  #     for record in records : {
  #       # zone_id      = data.terraform_remote_state.route53_zone.outputs.route53_zone[domain].route53_zone_zone_id[domain]
  #       zone_name    = zone
  #       records = [

  #       ]
  #       record_name  = record.name
  #       record_value = record.value
  #       record_type  = try(record.type, "A")
  #       record_ttl   = try(record.ttl, "3600")
  #     }
  #   ]
  # ])


  cluster_records_by_zone = flatten([
    for zone, record_list in var.cluster_records : {
      zone_name = zone
      records = [
        for record in record_list : {
          name = record.name
          type = try(record.typ, "A")
          ttl  = try(record.ttl, "3600")
          records = [
            record.value,
          ]
        }
      ]
    }
  ])
}
