output "output_vn_lb_external" {
    value = {
    lb_zone_id   = module.external_proxy_gw.lb_zone_id
    lb_dns_name   = module.external_proxy_gw.lb_dns_name
  }
}
