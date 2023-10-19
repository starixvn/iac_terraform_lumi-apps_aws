output "output_vn_lb_external" {
    value = {
    lb_zone_id   = module.alb_proxy_gw.lb_zone_id
    lb_dns_name   = module.alb_proxy_gw.lb_dns_name
  }
}
