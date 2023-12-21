project = "cloud"
team = "Lumi"
aws_region = "ap-east-1"
environment = "local"
aws_profile = "local-iac-terraform-ci"
aws_region_bucket_remote_state = "cloud-lumi-starix-tf-goshawk"
aws_region_key_remote_state    = "env:/local/vpc-terraform.tfstate"
aws_region_key_iam_remote_state = "env:/local/lumi-iam-tf.tfstate"
aws_region_bucket_remote_state_vn = "cloud-lumi-starix-tf-goshawk"
aws_region_key_sg_remote_state_vn = "env:/local/lumi-sg-tf.tfstate"

################## Whitelist
allow_whitelist = "202.78.231.32/27,120.72.109.32/29,120.72.83.128/29"
cidr_block_internal = ["10.6.48.0/20","10.6.64.0/20","10.6.80.0/20","10.6.0.0/20","10.6.16.0/20","10.6.32.0/20"] #10.6.48.0/20,10.6.64.0/20,10.6.80.0/20
allow_cidr_block_internal = "10.6.48.0/20,10.6.64.0/20,10.6.80.0/20,10.6.0.0/20,10.6.16.0/20,10.6.32.0/20"
vpc_id = "vpc-039a936178b304105"
##################  EC2
public_key_location = "key/id_rsa.pub"
private_key_location = "key/id_rsa"
proxy_gw_vm = [
  {
    "application_name" : "proxy-gw-01",
    "instance_type" : "t3.micro",
    "ami" : "ubuntu22",
    "volume_type" : "gp3",
    "volume_size" : "20",
    "subnet_id" : "subnet-06fe4c10600cb02db",
    "private_ip" : "10.6.48.10",
  },
]

monitor_vm = [
  /*{
    "application_name" : "zabbix-01",
    "instance_type" : "t3.large",
    "ami" : "ubuntu22",
    "volume_type" : "gp3",
    "volume_size" : "40",
    "subnet_id" : "subnet-06fe4c10600cb02db",
    "private_ip" : "10.6.48.101",
  },*/
]

apps_vm = [
  {
    "application_name" : "db-01",
    "instance_type" : "t4g.micro",
    "ami" : "ubuntu22arm",
    "volume_type" : "gp3",
    "volume_size" : "40",
    "subnet_id" : "subnet-06fe4c10600cb02db",
    "private_ip" : "10.6.48.200",
    "tag" : "stopoutofworking"
  },
  {
    "application_name" : "db-02",
    "instance_type" : "t4g.micro",
    "ami" : "ubuntu22arm",
    "volume_type" : "gp3",
    "volume_size" : "40",
    "subnet_id" : "subnet-01667b309462c88dd",
    "private_ip" : "10.6.64.200",
    "tag" : "stopoutofworking"
  },
  {
    "application_name" : "db-03",
    "instance_type" : "t4g.micro",
    "ami" : "ubuntu22arm",
    "volume_type" : "gp3",
    "volume_size" : "40",
    "subnet_id" : "subnet-00da5f1187472fb52",
    "private_ip" : "10.6.80.200",
    "tag" : "stopoutofworking"
  },
  {
    "application_name" : "zabbix-01",
    "instance_type" : "t3.medium",
    "ami" : "ubuntu22",
    "volume_type" : "gp3",
    "volume_size" : "40",
    "subnet_id" : "subnet-06fe4c10600cb02db",
    "private_ip" : "10.6.48.100",
    "tag" : "EC2"
  },

]
