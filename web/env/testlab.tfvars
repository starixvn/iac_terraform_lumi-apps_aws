project = "clouddemo"
team = "Lumi"
aws_region = "ap-northeast-1"
environment = "testlab"
aws_profile = "test-iac-terraform-ci"
aws_region_bucket_remote_state = "clouddemo-lumi-starix-tf-terrapin"
aws_region_key_remote_state    = "env:/testlab/vpc-terraform.tfstate"

################EC2
public_key_location = "key/id_rsa.pub"
private_key_location = "key/id_rsa"
proxy_gw_configuration = [
  {
    "application_name" : "proxy-gw-1",
    "instance_type" : "t2.micro",
    "ami" : "ubuntu22",
    "no_of_instances" : "1",
    "volume_type" : "gp3",
    "volume_size" : "20",
  },
  {
    "application_name" : "proxy-gw-02",
    "instance_type" : "t2.micro",
    "ami" : "ubuntu22",
    "no_of_instances" : "0",
    "volume_type" : "gp3",
    "volume_size" : "20",
  },
]
apps_configuration = [
  {
    "application_name" : "app-01",
    "instance_type" : "t2.micro",
    "ami" : "ubuntu22",
    "no_of_instances" : "1",
    "volume_type" : "gp3",
    "volume_size" : "20",
  },
  {
    "application_name" : "app-02",
    "instance_type" : "t2.micro",
    "ami" : "ubuntu22",
    "no_of_instances" : "0",
    "volume_type" : "gp3",
    "volume_size" : "20",
  },
]

#sc_web_ec2_private_ips = ["20.0.1.42","20.0.1.43","20.0.1.44","20.0.1.45"]
#sc_hap_ec2_private_ips = ["20.0.1.102","20.0.1.103"]
#test_web_ec2_private_ips = ["20.0.1.241","20.0.1.242","20.0.1.243"]
