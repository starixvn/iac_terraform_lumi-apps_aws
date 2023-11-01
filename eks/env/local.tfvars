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
  "lumi-eks-on-demand-x86" = {
    name            = "lumi-eks-on-demand-x86"
    subnet_ids = ["subnet-0ef5da55d9864197c"]
    use_custom_launch_template = true

    labels = {
            "luminet-app" = "yes"
            "nexops" = "yes"
          }

    ami_type     = "AL2_x86_64"
    min_size     = 0
    max_size     = 1
    desired_size = 1
    instance_types = [
      "t3.large"
    ]
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
          recurrence   = "00 19 * * MON-FRI"
        }
      }
  },
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
