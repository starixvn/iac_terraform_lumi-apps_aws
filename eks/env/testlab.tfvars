project = "clouddemo"
team = "Lumi"
aws_region = "ap-northeast-1"
environment = "testlab"
aws_profile = "test-iac-terraform-ci"
aws_region_bucket_remote_state = "clouddemo-lumi-starix-tf-terrapin"
aws_region_key_remote_state    = "env:/testlab/vpc-terraform.tfstate"
####
autoscaling_average_cpu = 30
cluster_version = "1.27"

eks_managed_node_groups = {
  "lumi-eks-on_demand-arm" = {
    name            = "lumi-eks-on_demand-arm"
    remote_access = {
      ec2_ssh_key = "eks-terraform-key"
    }
    use_custom_launch_template = false
    taints = [
        {
          key    = "dedicated"
          value  = "gpuGroup"
          effect = "NO_SCHEDULE"
        }
      ]
    labels = {
            "luminet-app" = "yes"
          }

    ami_type     = "AL2_ARM_64"
    min_size     = 0
    max_size     = 1
    desired_size = 1
    instance_types = [
      "t4g.medium"
    ]
    disk_size = 20
    capacity_type = "ON_DEMAND"
    network_interfaces = [{
      delete_on_termination       = true
      associate_public_ip_address = false
    }]
    tags = {
        Name = "lumi-eks-on_demand-arm"
      }
  },
  "lumi-eks-spot-x86" = {
    name            = "lumi-eks-spot-x86"
    use_custom_launch_template = false
    taints = [
        {
          key    = "dedicated"
          value  = "gpuGroup"
          effect = "NO_SCHEDULE"
        }
      ]
    remote_access = {
      ec2_ssh_key = "eks-terraform-key"
    }
    labels = {
            "luminet-app" = "yes"
          }

    ami_type     = "AL2_x86_64"
    min_size     = 0
    max_size     = 1
    desired_size = 1
    instance_types = [
      "t3a.medium"
    ]
    disk_size = 20
    capacity_type = "SPOT"
    network_interfaces = [{
      delete_on_termination       = true
      associate_public_ip_address = false
    }]
    tags = {
        Name = "lumi-eks-spot-x86"
      }
  }
}
###############
spot_termination_handler_chart_name      = "aws-node-termination-handler"
spot_termination_handler_chart_repo      = "https://aws.github.io/eks-charts"
spot_termination_handler_chart_version   = "0.21.0"
spot_termination_handler_chart_namespace = "kube-system"

###############
namespaces = ["haproxy","sample-apps","nexops-apps"]
###############
admin_users     = ["admin1", "admin2"]
developer_users = ["dev1", "dev2"]
