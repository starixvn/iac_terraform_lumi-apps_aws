output "proxy_gw_private_ip" {
    value = module.proxy_gw_linux
}
output "ec2_zabbix" {
  description = "The ID of the instance ec2_zabbix"
  value       = module.private_zabbix_linux
}