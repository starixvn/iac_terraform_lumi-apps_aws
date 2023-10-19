aws_region = "ap-northeast-1"
environment = "prod"
aws_region_bucket_remote_state = "luminet-aws-terraform-powerful-cod"
aws_region_key_remote_state    = "env:/dev/vpc-terraform.tfstate"

#####EC2
instance_type = "t2.micro"
private_instance_count = 2
public_key_location = "key/id_rsa.pub"
private_key_location = "key/id_rsa"
#SC1
sc1_ec2_private_ips = ["20.0.10.41","20.0.10.42","20.0.10.43","20.0.10.44","20.0.10.45"]
sc2_ec2_private_ips = ["20.0.12.41","20.0.12.42","20.0.12.43"]
sc1_private_instance_count = 2
sc2_private_instance_count = 2
###App
app_name1 = "sc-uat-site1"
domain_1 = "luminetsoft.com"
