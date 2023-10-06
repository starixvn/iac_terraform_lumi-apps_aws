module "eks" {
  source                 = "gitlab.nexdev.net/iac-terraform/aws-eks/aws"
  version                = "19.15.3"
  
  cluster_name    = local.cluster_name
  cluster_version = "1.27"

  vpc_id                         = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids                     = data.terraform_remote_state.vpc.outputs.private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

  }

  eks_managed_node_groups = {
    one = {
      name = "${var.team}-eks-worker-gr1"

      instance_types = ["t3.micro"]

      min_size     = 1
      max_size     = 3
      desired_size = 2
    }

    two = {
      name = "${var.team}-eks-worker-gr2"

      instance_types = ["t3.micro"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}


# https://aws.amazon.com/blogs/containers/amazon-ebs-csi-driver-is-now-generally-available-in-amazon-eks-add-ons/ 
data "aws_iam_policy" "ebs_csi_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}

module "irsa-ebs-csi" {
  source  = "gitlab.nexdev.net/iac-terraform/aws-iam/aws//modules/iam-assumable-role-with-oidc"
  version = "4.7.0"
  #source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  #version = "4.7.0"
  create_role                   = true
  role_name                     = "AmazonEKSTFEBSCSIRole-${module.eks.cluster_name}"
  provider_url                  = module.eks.oidc_provider
  role_policy_arns              = [data.aws_iam_policy.ebs_csi_policy.arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:kube-system:ebs-csi-controller-sa"]
}
