project = "clouddemo"
team = "Lumi"
aws_region = "ap-northeast-1"
environment = "testlab"
aws_profile = "test-iac-terraform-ci"
aws_region_bucket_remote_state = "clouddemo-lumi-starix-tf-terrapin"
aws_region_key_remote_state    = "env:/testlab/vpc-terraform.tfstate"
aws_region_key_remote_state_zone    = "env:/testlab/route53-tf.tfstate"

################Proxy GW
nlb_proxy_gw = "false" # set true if Internal LB
################  EC2
public_key_location = "key/id_rsa.pub"
private_key_location = "key/id_rsa"
proxy_gw_vm = [
  {
    "application_name" : "proxy-gw-01",
    "instance_type" : "t2.micro",
    "ami" : "ubuntu22",
    "volume_type" : "gp3",
    "volume_size" : "20",
    "private_ip" : "10.6.32.10",
  },
  {
    "application_name" : "proxy-gw-02",
    "instance_type" : "t2.micro",
    "ami" : "ubuntu22",
    "volume_type" : "gp3",
    "volume_size" : "20",
    "private_ip" : "10.6.32.11",
  },
]
apps_vm = [
  {
    "application_name" : "app-01",
    "instance_type" : "t2.micro",
    "ami" : "ubuntu22",
    "volume_type" : "gp3",
    "volume_size" : "20",
    "private_ip" : "10.6.32.100",
  },
]
############### Route53
domain_ns_records = [
  {
    "zone_id" : "luminetsoft.com",
    "name_servers" : "staging.luminetsoft.com",
    "name" : "staging",
    "type" : "NS",
    "ttl" : "86400",
  },
]

domain_a_records = {
  "luminetsoft.com" = [
    {
          "name" : "*",
          "type" : "A",
          "ttl" : "3600",
          "record" : "10.10.50.69",
    },
    {
          "name" : "nexops",
          "type" : "A",
          "ttl" : "3600",
          "record" : "202.78.231.55",
    },
  ],  
}


domain_alias_records = {
  "luminetsoft.com" = [
    {
        "name" : "w1",
        "type" : "A",
    },
    {
        "name" : "w2",
        "type" : "A",
    },
  ],
  "staging.luminetsoft.com" = [
    {
        "name" : "w1",
        "type" : "A",
    },
    {
        "name" : "w2",
        "type" : "A",
    },
  ],
}