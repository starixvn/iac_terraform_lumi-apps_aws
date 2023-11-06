output "cluster_endpoint" {
  value = module.cluster.cluster_endpoint
}
output "cluster_certificate_authority_data" {
  value = module.cluster.cluster_certificate_authority_data
}

output "cluster_addons" {
  value = module.cluster.cluster_addons
}
