project = "cloud"
team = "Lumi"
aws_region = "ap-east-1"
environment = "local"
aws_profile = "local-iac-terraform-ci"
aws_region_bucket_remote_state = "cloud-lumi-starix-tf-goshawk"
aws_region_key_remote_state    = "env:/local/vpc-terraform.tfstate"

################EC2
public_key_location = "key/id_rsa.pub"
private_key_location = "key/id_rsa"
###LUMI WEB
proxy_gw_configuration = [
  {
    "application_name" : "proxy_gw-1",
    "instance_type" : "t2.micro",
    "ami" : "ubuntu22",
    "no_of_instances" : "1",
    "volume_type" : "gp3",
    "volume_size" : "20",
  },
  {
    "application_name" : "proxy_gw-02",
    "instance_type" : "t2.micro",
    "ami" : "ubuntu22",
    "no_of_instances" : "1",
    "volume_type" : "gp3",
    "volume_size" : "20",
  },
]
web_server_configuration = [
  {
    "application_name" : "app_server-1",
    "instance_type" : "t3.micro",
    "ami" : "windows2022",
    "no_of_instances" : "1",
    "volume_type" : "gp3",
    "volume_size" : "30",
  },
  {
    "application_name" : "app_server-2",
    "instance_type" : "t2.micro",
    "ami" : "ubuntu22",
    "no_of_instances" : "1",
    "volume_type" : "gp3",
    "volume_size" : "20",
  },
  {
    "application_name" : "web_server-1",
    "instance_type" : "t2.micro",
    "ami" : "ubuntu22",
    "no_of_instances" : "1",
    "volume_type" : "gp3",
    "volume_size" : "20",
  },
  
]