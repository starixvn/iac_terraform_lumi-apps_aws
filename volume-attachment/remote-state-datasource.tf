# Terraform Remote State Datasource
data "terraform_remote_state" "ec2" {
  backend = "s3"
  config = {
    bucket = "${var.aws_region_bucket_remote_state_vn}"
    key    = "${var.aws_region_key_ec2_remote_state_vn}"
    region = "${var.aws_region}"
  }
}
