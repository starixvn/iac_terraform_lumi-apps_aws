# Terraform Remote State - VPC
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "${var.aws_region_bucket_remote_state}"
    key    = "${var.aws_region_key_remote_state}"
    region = "${var.aws_region}"
  }
}

# Terraform Remote State  - Certificate
data "terraform_remote_state" "acm_cert" {
  backend = "s3"
  config = {
    bucket = "${var.aws_region_bucket_remote_state}"
    key    = "${var.aws_region_key_remote_state_acm}"
    region = "${var.aws_region}"
  }
}
data "terraform_remote_state" "sg" {
  backend = "s3"
  config = {
    bucket = "${var.aws_region_bucket_remote_state_vn}"
    key    = "${var.aws_region_key_sg_remote_state_vn}"
    region = "${var.aws_region}"
  }
}