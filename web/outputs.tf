output "output_nlb" {
    value = {
    lb_zone_id   = module.nlb_proxy_gw.lb_zone_id
    lb_dns_name   = module.nlb_proxy_gw.lb_dns_name
  }
}
/*
output "output_ec2" {
  value = {
    proxy_gw_private_ip   = module.proxy_gw_linux["proxy-gw-1"].private_ip
    #route53_zone_name_servers = "${data.terraform_remote_state.route53_zone.outputs.route53_zone["staging.luminetsoft.com"].route53_zone_name_servers}"
  }
}

output "proxy_gw_private_ip_testing" {
    value = module.proxy_gw_linux
}

output "proxy_gw_private_ip" {
    value = module.proxy_gw_linux["proxy-gw-1"].private_ip
}
*/