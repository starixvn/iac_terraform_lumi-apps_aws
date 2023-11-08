project = "clouddemo"
team = "Lumi"
aws_region = "ap-northeast-1"
environment = "testlab"
aws_profile = "test-iac-terraform-ci"
aws_region_bucket_remote_state = "clouddemo-lumi-starix-tf-terrapin"
aws_region_key_remote_state    = "env:/testlab/vpc-terraform.tfstate"
allow_whitelist = ["202.78.231.32/27","120.72.109.32/29","120.72.83.128/29"]
vpc_id = "vpc-0f6cc0c9ccb3533c5"
vpc_private_subnets = [
  "subnet-00fe0e2fec0ef7120",
  "subnet-0e99410b6e400e7a3",
  "subnet-088c3a4431b11579e"
]
####
autoscaling_average_cpu = 90
cluster_version = "1.27"
eks_managed_node_groups = {
  "lumi-eks-on-demand-x86" = {
    name            = "lumi-eks-on-demand-x86"
    subnet_ids = ["subnet-05baef15d22a6ccc2"]
    use_custom_launch_template = true

    labels = {
            "luminet-app" = "yes",
            "nexops" = "yes"
          }

    ami_type     = "AL2_x86_64"
    min_size     = 0
    max_size     = 1
    desired_size = 1
    instance_types = [
      "t3a.medium",
      "t3.medium"
    ]
    block_device_mappings = {
        xvda = {
          device_name = "/dev/xvda"
          ebs = {
            volume_size           = 10
            volume_type           = "gp3"
            iops                  = 3000
            throughput            = 150
            delete_on_termination = true
          }
        }
      }
    capacity_type = "ON_DEMAND"
    network_interfaces = [{
      delete_on_termination       = true
      associate_public_ip_address = false
    }]
    tag_specifications = [
      "instance",
      "volume",
      "network-interface"
    ]
    ####
    schedules = {
        scale-up = {
          min_size     = 0
          max_size     = "1" # Retains current max size
          desired_size = 1
          time_zone    = "Asia/Bangkok"
          recurrence   = "00 08 * * MON-FRI"
        },
        scale-down = {
          min_size     = 0
          max_size     = "1" # Retains current max size
          desired_size = 0
          time_zone    = "Asia/Bangkok"
          recurrence   = "55 16 * * MON-FRI"
        }
      }
  },
}
/*
"lumi-eks-spot-x86" = {
    name            = "lumi-eks-spot-x86"
    subnet_ids = ["subnet-0d3cd100ba5d9dc9d"]
    use_custom_launch_template = true
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
    block_device_mappings = {
        xvda = {
          device_name = "/dev/xvda"
          ebs = {
            volume_size           = 15
            volume_type           = "gp3"
            iops                  = 3000
            throughput            = 150
            delete_on_termination = true
          }
        }
      }
    capacity_type = "SPOT"
    network_interfaces = [{
      delete_on_termination       = true
      associate_public_ip_address = false
    }]
    tag_specifications = [
      "instance",
      "volume",
      "network-interface"
    ]
    ####
    schedules = {
        scale-up = {
          min_size     = 0
          max_size     = "1" # Retains current max size
          desired_size = 1
          start_time   = "2023-11-01T09:00:00Z"
          time_zone    = "Asia/Bangkok"
          recurrence   = "00 08 * * MON-FRI"
        },
        scale-down = {
          min_size     = 0
          max_size     = "1" # Retains current max size
          desired_size = 0
          start_time   = "2023-11-01T08:50:00Z"
          time_zone    = "Asia/Bangkok"
          recurrence   = "00 18 * * MON-FRI"
        }
      }
  }

    remote_access = {
      ec2_ssh_key = "eks-terraform-key"
    }
*/
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
