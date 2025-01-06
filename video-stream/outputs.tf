output "cdn_url" {
  value = {
    for k, cdn in module.cdn : k => cdn.cf_domain_name
  }
}

output "s3_bucket" {
  value = {
    for k, cdn in module.cdn : k => cdn.s3_bucket
  }
}
