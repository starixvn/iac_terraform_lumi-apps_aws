module "ns_records" {
  source   = "gitlab.nexdev.net/iac-terraform/aws-route53/aws//modules/records"
  version  = "2.10.2"
  for_each = { for record in local.domain_ns_config : record.name => record }
  zone_id  = data.terraform_remote_state.route53_zone.outputs.route53_zone[each.value.zone_id].route53_zone_zone_id[each.value.zone_id]
  records = [
    {
      name    = each.value.name
      type    = each.value.type
      ttl     = each.value.ttl
      records = data.terraform_remote_state.route53_zone.outputs.route53_zone[each.value.name_servers].route53_zone_name_servers[each.value.name_servers]
    },
  ]
}
########################### create Alias - Proxy GW LB

module "records" {
  source   = "gitlab.nexdev.net/iac-terraform/aws-route53/aws//modules/records"
  version  = "2.10.2"
  for_each = { for zone, record in local.domain_alias_config : zone => record }
  zone_id  = data.terraform_remote_state.route53_zone.outputs.route53_zone[each.value.domain_zone_alias].route53_zone_zone_id[each.value.domain_zone_alias]
  records = [
    {
      name = each.value.record_name_alias
      type = each.value.record_type_alias
      alias = {
        name    = data.terraform_remote_state.nlb.outputs.output_vn_lb_external.lb_dns_name
        zone_id = data.terraform_remote_state.nlb.outputs.output_vn_lb_external.lb_zone_id
      }
    },

  ]
}

###########################  for A record
module "alias" {
  source   = "gitlab.nexdev.net/iac-terraform/aws-route53/aws//modules/records"
  version  = "2.10.2"
  for_each = { for zone, record in local.domain_a_config : zone => record }
  zone_id  = data.terraform_remote_state.route53_zone.outputs.route53_zone[each.value.domain_zone_a].route53_zone_zone_id[each.value.domain_zone_a]
  records = [
    {
      name = each.value.record_name_a
      type = each.value.record_type_a
      ttl  = each.value.record_ttl_a
      records = [
        each.value.record_value_a,
      ]
    },
  ]

}
