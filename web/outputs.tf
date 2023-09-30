/*
output "proxy_gw_private_ip_testing" {
    value = module.proxy_gw_linux
}
*/
output "proxy_gw_private_ip" {
    value = module.proxy_gw_linux["proxy-gw-1"].private_ip
}