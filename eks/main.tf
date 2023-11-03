# create EKS cluster

module "cluster" {
  source = "gitlab.nexdev.net/iac-terraform/aws-eks/aws"
  version = "19.15.3"

  cluster_name                    = lower("${var.team}-${var.environment}-eks")
  cluster_version                 = "${var.cluster_version}"
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true
  cluster_endpoint_public_access_cidrs = ["10.6.32.0/20","202.78.231.32/27","120.72.109.32/29","120.72.83.128/29"]
  cluster_addons = {
    coredns = {
      most_recent = true
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
      most_recent              = true
      before_compute           = true
      configuration_values = jsonencode({
        env = {
          # Reference docs https://docs.aws.amazon.com/eks/latest/userguide/cni-increase-ip-addresses.html
          ENABLE_PREFIX_DELEGATION = "true"
          WARM_PREFIX_TARGET       = "1"
        }
      })
    }
  }
  vpc_id                          = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids                      = data.terraform_remote_state.vpc.outputs.private_subnets
  eks_managed_node_groups         = var.eks_managed_node_groups
  tags = merge(
    local.common_tags,
    {
      Resource = "EKS"
    },
  )

}

# set spot fleet Autoscaling policy
resource "aws_autoscaling_policy" "eks_autoscaling_policy" {
  count = length(var.eks_managed_node_groups)

  name                   = "${module.cluster.eks_managed_node_groups_autoscaling_group_names[count.index]}-autoscaling-policy"
  autoscaling_group_name = module.cluster.eks_managed_node_groups_autoscaling_group_names[count.index]
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = var.autoscaling_average_cpu
  }

}
