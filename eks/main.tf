# create EKS cluster

module "cluster" {
  source = "gitlab.nexdev.net/iac-terraform/aws-eks/aws"
  version = "19.15.3"

  cluster_name                    = lower("${var.team}-${var.environment}-eks")
  cluster_version                 = "1.26"
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true
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
output "cluster_endpoint" {
  value = module.cluster.cluster_endpoint
}
output "cluster_certificate_authority_data" {
  value = module.cluster.cluster_certificate_authority_data
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
