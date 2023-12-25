project = "cloud"
team = "Lumi"
aws_region = "ap-east-1"
environment = "local"
aws_profile = "local-iac-terraform-ci"
aws_region_bucket_remote_state = "cloud-lumi-starix-tf-goshawk"
aws_region_bucket_remote_state_vn = "cloud-lumi-starix-tf-goshawk"
aws_region_key_sg_remote_state_vn = "env:/local/lumi-sg-tf.tfstate"
aws_region_key_remote_state    = "env:/local/vpc-terraform.tfstate"
aws_region_key_remote_state_acm    = "env:/local/route53-acme-certificate-tf.tfstate"

################  EC2
proxy_gw_vm = [
  {
    "application_name" : "proxy-gw-01",
    "instance_type" : "t3.micro",
    "ami" : "ubuntu22",
    "volume_type" : "gp3",
    "volume_size" : "20",
    "private_ip" : "10.6.48.10",
  },
]
apps_vm = [
  {
    "application_name" : "app-01",
    "instance_type" : "t3.micro",
    "ami" : "ubuntu22",
    "volume_type" : "gp3",
    "volume_size" : "20",
    "private_ip" : "10.6.48.100",
  },
]
