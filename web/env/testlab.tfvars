project = "clouddemo"
team = "Lumi"
aws_region = "ap-northeast-1"
environment = "testlab"
aws_profile = "test-iac-terraform-ci"
aws_region_bucket_remote_state = "clouddemo-lumi-starix-tf-terrapin"
aws_region_key_remote_state    = "env:/testlab/vpc-terraform.tfstate"

################Proxy GW
nlb_proxy_gw = "false" # set true if Internal LB
################EC2
public_key_location = "key/id_rsa.pub"
private_key_location = "key/id_rsa"
proxy_gw_vm = [
  {
    "application_name" : "proxy-gw-01",
    "instance_type" : "t2.micro",
    "ami" : "ubuntu22",
    "volume_type" : "gp3",
    "volume_size" : "20",
    "private_ip" : "20.0.1.6",
  },
  /*{
    "application_name" : "proxy-gw-02",
    "instance_type" : "t2.micro",
    "ami" : "ubuntu22",
    "volume_type" : "gp3",
    "volume_size" : "20",
    "private_ip" : "20.0.1.7",
  },
  {
    "application_name" : "proxy-gw-03",
    "instance_type" : "t3.micro",
    "ami" : "ubuntu22",
    "volume_type" : "gp3",
    "volume_size" : "20",
    "private_ip" : "20.0.1.8",
  },*/
]
apps_vm = [
  {
    "application_name" : "app-01",
    "instance_type" : "t2.micro",
    "ami" : "ubuntu22",
    "volume_type" : "gp3",
    "volume_size" : "20",
    "private_ip" : "20.0.2.6",
  },
  /*{
    "application_name" : "app-02",
    "instance_type" : "t3.micro",
    "ami" : "ubuntu22",
    "volume_type" : "gp3",
    "volume_size" : "20",
    "private_ip" : "20.0.2.7",
  },
  {
    "application_name" : "app-03",
    "instance_type" : "t2.micro",
    "ami" : "ubuntu22",
    "volume_type" : "gp3",
    "volume_size" : "20",
    "private_ip" : "20.0.2.8",
  },
  {
    "application_name" : "app-04",
    "instance_type" : "t2.micro",
    "ami" : "ubuntu22",
    "volume_type" : "gp3",
    "volume_size" : "20",
    "private_ip" : "20.0.2.9",
  },*/
]
