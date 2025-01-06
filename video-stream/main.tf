##########################################
# resource "aws_cloudfront_origin_access_control" "s3-sigv4" {
#   count                             = var.create_origin_access_control ? 1 : 0
#   name                              = "tf-s3-sigv4"
#   origin_access_control_origin_type = "s3"
#   signing_behavior                  = "always"
#   signing_protocol                  = "sigv4"
# }


module "cdn" {
  source = "cloudposse/cloudfront-s3-cdn/aws"
  # Cloud Posse recommends pinning every module to a specific version
  version = "0.96.0"

  for_each = { for idx, project in var.projects : idx => project }

  namespace                          = each.value.namespace
  stage                              = each.value.stage
  name                               = each.value.name
  aliases                            = try(each.value.aliases, [])
  dns_alias_enabled                  = each.value.dns_alias_enabled
  parent_zone_name                   = try(each.value.parent_zone_name, "")
  deployment_principal_arns          = each.value.deployment_principal_arns
  cors_allowed_methods               = each.value.cors_allowed_methods
  cors_allowed_headers               = each.value.cors_allowed_headers
  cors_allowed_origins               = each.value.cors_allowed_origins
  allowed_methods                    = each.value.allowed_methods
  tags                               = local.common_tags
  cloudfront_access_logging_enabled  = false
  versioning_enabled                 = false
  origin_access_type                 = each.value.origin_access_type
  block_origin_public_access_enabled = try(each.value.block_origin_public_access_enabled, true)

  # cloudfront_origin_access_control_id = origin_access_control_enabled ? aws_cloudfront_origin_access_control.s3-sigv4.id : ""
}
