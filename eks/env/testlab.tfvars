project = "clouddemo"
team = "Lumi"
aws_region = "ap-northeast-1"
environment = "testlab"
aws_profile = "test-iac-terraform-ci"
aws_region_bucket_remote_state = "clouddemo-lumi-starix-tf-terrapin"
aws_region_key_remote_state    = "env:/testlab/vpc-terraform.tfstate"
####
autoscaling_average_cpu = 30
eks_managed_node_groups = {
  "my-app-eks-x86" = {
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
  "my-app-eks-arm" = {
    ami_type     = "AL2_ARM_64"
    min_size     = 1
    max_size     = 16
    desired_size = 1
    instance_types = [
      "t4g.small",
      "t4g.medium"
    ]
    capacity_type = "ON_DEMAND"
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
/*
dns_base_domain               = "staging.luminetsoft.com"
external_dns_iam_role      = "external-dns"
external_dns_chart_name    = "external-dns"
external_dns_chart_repo    = "https://kubernetes-sigs.github.io/external-dns/"
external_dns_chart_version = "1.9.0"

external_dns_values = {
  "image.repository"   = "k8s.gcr.io/external-dns/external-dns",
  "image.tag"          = "v0.11.0",
  "logLevel"           = "info",
  "logFormat"          = "json",
  "triggerLoopOnEvent" = "true",
  "interval"           = "5m",
  "policy"             = "sync",
  "sources"            = "{ingress}"
}
######## Ingress
ingress_gateway_name          = "aws-load-balancer-controller"
ingress_gateway_iam_role      = "load-balancer-controller"
ingress_gateway_chart_name    = "aws-load-balancer-controller"
ingress_gateway_chart_repo    = "https://aws.github.io/eks-charts"
ingress_gateway_chart_version = "1.4.1"
*/
###############
namespaces = ["sample-apps","nexops-apps"]
name_prefix             = "my-app"
###############
admin_users     = ["admin1", "admin2"]
developer_users = ["dev1", "dev2"]
