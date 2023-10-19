output "output_vn_lb_internal" {
    value = {
    lb_zone_id   = module.internal_proxy_gw.lb_zone_id
    lb_dns_name   = module.internal_proxy_gw.lb_dns_name
  }
}
