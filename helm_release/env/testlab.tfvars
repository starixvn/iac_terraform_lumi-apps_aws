project = "clouddemo"
team = "Lumi"
aws_region = "ap-northeast-1"
environment = "testlab"
aws_profile = "test-iac-terraform-ci"
aws_region_bucket_remote_state = "clouddemo-lumi-starix-tf-terrapin"
aws_region_key_remote_state    = "env:/testlab/lumi-eks-tf.tfstate"
allow_whitelist = ["202.78.231.32/27","120.72.109.32/29","120.72.83.128/29"]

###############
namespaces = ["nap","alpha"]
###############

