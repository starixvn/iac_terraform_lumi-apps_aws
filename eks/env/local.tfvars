project = "cloud"
team = "Lumi"
aws_region = "ap-east-1"
environment = "local"
aws_profile = "local-iac-terraform-ci"
aws_region_bucket_remote_state = "cloud-lumi-starix-tf-goshawk"
aws_region_key_remote_state    = "env:/local/vpc-terraform.tfstate"
####
autoscaling_average_cpu = 30
/*
  "lumi-eks-on_demand-arm" = {
    ami_type     = "AL2_ARM_64"
    min_size     = 1
    max_size     = 1
    desired_size = 1
    instance_types = [
      "t4g.medium"
    ]
    capacity_type = "ON_DEMAND"
    network_interfaces = [{
      delete_on_termination       = true
      associate_public_ip_address = false
    }]
  }

  "lumi-eks-spot-x86" = {
    ami_type     = "AL2_x86_64"
    min_size     = 1
    max_size     = 16
    desired_size = 1
    instance_types = [
      "t3a.small",
      "t3a.medium",
      "t3a.large"
    ]
    capacity_type = "SPOT"
    network_interfaces = [{
      delete_on_termination       = true
      associate_public_ip_address = false
    }]
  }
*/

eks_managed_node_groups = {
  "lumi-eks-spot-x86" = {
    ami_type     = "AL2_x86_64"
    min_size     = 1
    max_size     = 1
    desired_size = 1
    instance_types = [
      "t3a.medium",
      "t3a.large"
    ]
    capacity_type = "SPOT"
    network_interfaces = [{
      delete_on_termination       = true
      associate_public_ip_address = false
    }]
  }
}

###############
spot_termination_handler_chart_name      = "aws-node-termination-handler"
spot_termination_handler_chart_repo      = "https://aws.github.io/eks-charts"
spot_termination_handler_chart_version   = "0.21.0"
spot_termination_handler_chart_namespace = "kube-system"

###############
namespaces = ["haproxy","sample-apps","nexops-apps"]
name_prefix             = "my-app"
###############
admin_users     = ["admin1", "admin2"]
developer_users = ["dev1", "dev2"]
