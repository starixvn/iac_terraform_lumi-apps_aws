project = "cloud"
team = "Lumi"
aws_region = "ap-northeast-1"
environment = "prod"
aws_profile = "prod-iac-terraform-ci"
aws_region_bucket_remote_state = "spnk-terraform-remote-state-s3"
aws_region_key_remote_state    = "spnk-terraform-akira-vpc.tfstate"
aws_region_key_iam_remote_state = "spnk-terraform-asura-vpc-ec2-iam.tfstate"
aws_region_bucket_remote_state_vn = "cloud-lumi-starix-tf-ghost"
aws_region_key_sg_remote_state_vn = "env:/prod/lumi-sg-tf.tfstate"
vpc_id = "vpc-083b51ed3f83c5096"
# vpc_private_subnets = [
#   A "subnet-0a8d5a1eef57bb185", 10.88.48.0/21 (2k): 10.88.48.1->10.88.55.254 
#   C "subnet-0cb97999f4cf68d03", 10.88.56.0/21 (2k): 10.88.56.1->10.88.63.254
#   D "subnet-0bbd3d3adba525a51" 10.88.64.0/21 (2k): 10.88.64.1->10.88.71.254
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
    "subnet_id" : "subnet-0a8d5a1eef57bb185",
    "private_ip" : "10.88.55.100",
    "tag" : "EC2"
  },
  {
    "application_name" : "proxy-gw-02",
    "instance_type" : "t3.small",
    "ami" : "ubuntu22",
    "volume_type" : "gp3",
    "volume_size" : "40",
    "subnet_id" : "subnet-0cb97999f4cf68d03",
    "private_ip" : "10.88.56.100",
    "tag" : "EC2"
  },

]

monitor_vm = [
  {
    "application_name" : "ansible-01",
    "instance_type" : "t3a.medium",
    "ami" : "ubuntu22vn",
    "volume_type" : "gp3",
    "volume_size" : "60",
    "subnet_id" : "subnet-0a8d5a1eef57bb185",
    "private_ip" : "10.88.55.107",
    "tag" : "EC2"
  },
  {
    "application_name" : "registry-02",
    "instance_type" : "t3a.small",
    "ami" : "ubuntu22vn",
    "volume_type" : "gp3",
    "volume_size" : "50",
    "subnet_id" : "subnet-0a8d5a1eef57bb185",
    "private_ip" : "10.88.55.109",
    "tag" : "EC2"
  },
]
## Zone A: subnet-0a8d5a1eef57bb185 C: subnet-0cb97999f4cf68d03 D: subnet-0bbd3d3adba525a51
apps_vm = [
  /*
  {
    "application_name" : "dbsg-01",
    "instance_type" : "r7g.medium",
    "ami" : "ubuntu22arm",
    "volume_type" : "gp3",
    "volume_size" : "40",
    "subnet_id" : "subnet-0a8d5a1eef57bb185",
    "private_ip" : "10.88.55.115",
    "tag" : "DB"
    
  },
  {
    "application_name" : "dbsg-02",
    "instance_type" : "r7g.medium",
    "ami" : "ubuntu22arm",
    "volume_type" : "gp3",
    "volume_size" : "40",
    "subnet_id" : "subnet-0cb97999f4cf68d03",
    "private_ip" : "10.88.56.115",
    "tag" : "DB"
  },
  {
    "application_name" : "dbsg-03",
    "instance_type" : "r7g.medium",
    "ami" : "ubuntu22arm",
    "volume_type" : "gp3",
    "volume_size" : "40",
    "subnet_id" : "subnet-0bbd3d3adba525a51",
    "private_ip" : "10.88.64.115",
    "tag" : "DB"
  },
  {
    "application_name" : "dbvg-01",
    "instance_type" : "r7g.medium",
    "ami" : "ubuntu22arm",
    "volume_type" : "gp3",
    "volume_size" : "40",
    "subnet_id" : "subnet-0a8d5a1eef57bb185",
    "private_ip" : "10.88.55.116",
    "tag" : "DB"
    
  },
  {
    "application_name" : "dbvg-02",
    "instance_type" : "r7g.medium",
    "ami" : "ubuntu22arm",
    "volume_type" : "gp3",
    "volume_size" : "40",
    "subnet_id" : "subnet-0cb97999f4cf68d03",
    "private_ip" : "10.88.56.116",
    "tag" : "DB"
  },
  {
    "application_name" : "dbvg-03",
    "instance_type" : "r7g.medium",
    "ami" : "ubuntu22arm",
    "volume_type" : "gp3",
    "volume_size" : "40",
    "subnet_id" : "subnet-0bbd3d3adba525a51",
    "private_ip" : "10.88.64.116",
    "tag" : "DB"
  },
  {
    "application_name" : "db-archive-01",
    "instance_type" : "r7g.large",
    "ami" : "ubuntu22arm",
    "volume_type" : "gp3",
    "volume_size" : "100",
    "subnet_id" : "subnet-0a8d5a1eef57bb185",
    "private_ip" : "10.88.55.117",
    "tag" : "DB"
  },
  */
]