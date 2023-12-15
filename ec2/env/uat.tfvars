project = "cloud"
team = "Lumi"
aws_region = "ap-northeast-1"
environment = "uat"
aws_profile = "uat-iac-terraform-ci"
aws_region_bucket_remote_state = "spnk-terraform-remote-state-s3"
aws_region_key_remote_state    = "spnk-terraform-akira-vpc.tfstate"
################## Whitelist
allow_whitelist = "202.78.231.32/27,120.72.109.32/29,120.72.83.128/29"
cidr_block_internal = ["10.88.112.0/20","10.88.128.0/20","10.88.144.0/20","10.77.15.0/24","10.77.25.0/24","10.88.48.0/21","10.88.56.0/21","10.88.64.0/21"] #["10.77.0.0/16","10.88.0.0/16"] #
allow_cidr_block_internal = "10.88.112.0/20,10.88.128.0/20,10.88.144.0/20,10.77.15.0/24,10.77.25.0/24,10.88.48.0/21,10.88.56.0/21,10.88.64.0/21"
vpc_id = "vpc-083b51ed3f83c5096"
# vpc_private_subnets = [
#   "subnet-0ae72c2068513e76b",
#   "subnet-0ba2a5f74ec351acc",
#   "subnet-0f92f11b87239fbd5"
# ]

##################  EC2
public_key_location = "key/id_rsa.pub"
private_key_location = "key/id_rsa"
proxy_gw_vm = [
  {
    "application_name" : "proxy-gw-01",
    "instance_type" : "t3a.small",
    "ami" : "ubuntu22",
    "volume_type" : "gp3",
    "volume_size" : "40",
    "subnet_id" : "subnet-0ae72c2068513e76b",
    "private_ip" : "10.88.127.100",
  },
  {
    "application_name" : "proxy-gw-02",
    "instance_type" : "t3a.small",
    "ami" : "ubuntu22",
    "volume_type" : "gp3",
    "volume_size" : "40",
    "subnet_id" : "subnet-0ba2a5f74ec351acc",
    "private_ip" : "10.88.143.100",
  },
]

monitor_vm = []

apps_vm = [
  {
    "application_name" : "dbuat-01",
    "instance_type" : "t4g.micro",
    "ami" : "ubuntu22arm",
    "volume_type" : "gp3",
    "volume_size" : "40",
    "subnet_id" : "subnet-0ae72c2068513e76b",
    "private_ip" : "10.88.127.151",
  },
  {
    "application_name" : "dbuat-02",
    "instance_type" : "t4g.micro",
    "ami" : "ubuntu22arm",
    "volume_type" : "gp3",
    "volume_size" : "40",
    "subnet_id" : "subnet-0ae72c2068513e76b",
    "private_ip" : "10.88.127.152",
  },
  {
    "application_name" : "dbuat-03",
    "instance_type" : "t4g.micro",
    "ami" : "ubuntu22arm",
    "volume_type" : "gp3",
    "volume_size" : "40",
    "subnet_id" : "subnet-0ae72c2068513e76b",
    "private_ip" : "10.88.127.153",
  },
]