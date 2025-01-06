project                          = "cloud"
team                             = "Lumi"
aws_region                       = "ap-east-1"
environment                      = "local"
aws_profile                      = "local-iac-terraform-ci"
aws_region_bucket_remote_state   = "cloud-lumi-starix-tf-goshawk"
aws_region_key_remote_state      = "env:/local/vpc-terraform.tfstate"
aws_region_key_remote_state_zone = "env:/local/route53-tf.tfstate"
aws_region_key_remote_state_lb   = "env:/local/lumi-lb-external-tf.tfstate"
#######################################################

# create_origin_access_control = true

projects = [
  {
    namespace            = "sc"
    stage                = "local"
    name                 = "stream"
    dns_alias_enabled    = false
    allowed_methods      = ["GET", "HEAD", "OPTIONS"]
    cors_allowed_methods = ["GET", "HEAD"]
    cors_allowed_headers = [
      "Origin",
      "Access-Control-Allow-Origin",
      "Content-Type",
      "Accept"
    ]
    cors_allowed_origins = [
      "https://*.lumigame.com",
      "http://localhost:7456",
      "https://*.sgamesuat.com"
    ]
    deployment_principal_arns = {
      "arn:aws:iam::584102114761:user/ken.nguyen" = [""]
      "arn:aws:iam::584102114761:user/josh.tran"  = [""]
    }
    # origin_access_control_enabled = true
    origin_access_type = "origin_access_control"
  }
]
