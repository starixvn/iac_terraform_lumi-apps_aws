/*
output "proxy_gw_private_ip_testing" {
    value = module.proxy_gw_linux
}

output "proxy_gw_private_ip" {
    value = module.proxy_gw_linux["proxy-gw-1"].private_ip
}

output "output_zone_testing" {
  value = {
    route53_zone_zone_id   = data.terraform_remote_state.route53_zone.outputs.route53_zone["luminetsoft.com"].route53_zone_zone_id["luminetsoft.com"]
    route53_zone_name_servers = "${data.terraform_remote_state.route53_zone.outputs.route53_zone["staging.luminetsoft.com"].route53_zone_name_servers}"
  }
}
*/