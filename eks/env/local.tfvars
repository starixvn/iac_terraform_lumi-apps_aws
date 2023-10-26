project = "cloud"
team = "Lumi"
aws_region = "ap-east-1"
environment = "local"
aws_profile = "local-iac-terraform-ci"
aws_region_bucket_remote_state = "cloud-lumi-starix-tf-goshawk"
aws_region_key_remote_state    = "env:/local/vpc-terraform.tfstate"
####
cluster_version = "1.27"
autoscaling_average_cpu = 30
eks_managed_node_groups = {
  "lumi-eks-on_demand-arm" = {
    remote_access = {
      ec2_ssh_key = "eks-terraform-key"
    }
    use_custom_launch_template = false
    labels = {
            "luminet-app" = "yes"
            "nexops" = "yes"
          }

    ami_type     = "AL2_ARM_64"
    min_size     = 0
    max_size     = 1
    desired_size = 1
    block_device_mappings = {
        xvda = {
          device_name = "/dev/xvda"
          ebs = {
            volume_size           = 40
            volume_type           = "gp3"
            iops                  = 3000
            throughput            = 150
            delete_on_termination = true
          }
        }
      }
    instance_types = [
      "t4g.medium"
    ]
    capacity_type = "ON_DEMAND"
    network_interfaces = [{
      delete_on_termination       = true
      associate_public_ip_address = false
    }]
  },
  "lumi-eks-spot-x86" = {
    use_custom_launch_template = false
    remote_access = {
      ec2_ssh_key = "eks-terraform-key"
    }
    labels = {
            "luminet-app" = "yes"
            "nexops" = "yes"
          }

    ami_type     = "AL2_x86_64"
    min_size     = 0
    max_size     = 1
    desired_size = 1
    block_device_mappings = {
        xvda = {
          device_name = "/dev/xvda"
          ebs = {
            volume_size           = 40
            volume_type           = "gp3"
            iops                  = 3000
            throughput            = 150
            delete_on_termination = true
          }
        }
      }
    instance_types = [
      "t3.medium",
      "t3.large"
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
namespaces = ["haproxy","sample","nexops"]
###############
admin_users     = ["admin1", "admin2"]
developer_users = ["dev1", "dev2"]
  /*labels = {
            "luminet-app" = "yes"
          }*/