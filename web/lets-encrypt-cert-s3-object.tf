resource "aws_s3_object" "certificate_artifacts_s3_objects" {
  for_each = toset(["certificate_pem", "issuer_pem", "private_key_pem"])

  bucket  = var.aws_region_bucket_remote_state # TODO put your own S3 bucket, and create it before if necessary!
  key     = "ssl-certs/${each.key}"            # TODO set your own bucket path
  content = lookup(acme_certificate.certificate, "${each.key}")
}