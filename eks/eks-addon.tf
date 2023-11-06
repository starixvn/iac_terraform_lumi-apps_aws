# get EKS authentication for being able to manage k8s objects from terraform
provider "kubernetes" {
  host                   = module.cluster.cluster_endpoint
  cluster_ca_certificate = base64decode(module.cluster.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", local.cluster_name]
    command     = "aws"
  }
}

provider "helm" {
  kubernetes {
    host                   = module.cluster.cluster_endpoint
    cluster_ca_certificate = base64decode(module.cluster.cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", local.cluster_name]
      command     = "aws"
    }
  }
}

# deploy spot termination handler
resource "helm_release" "spot_termination_handler" {
  name          = var.spot_termination_handler_chart_name
  chart         = var.spot_termination_handler_chart_name
  repository    = var.spot_termination_handler_chart_repo
  version       = var.spot_termination_handler_chart_version
  namespace     = var.spot_termination_handler_chart_namespace
  wait_for_jobs = true
}


################# haproxy-ingress-controller
resource "helm_release" "haproxy-ingress-controller" {
  name       = "haproxy-ingress-controller"
  namespace  = "haproxy"
  repository = "https://haproxytech.github.io/helm-charts"
  chart      = "kubernetes-ingress"
  values = [
    "${file("values.yaml")}"
  ]
  set {
    name  = "controller.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "controller.ingressClass"
    value = "haproxy"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
    value = "nlb"
  }
  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-internal"
    value = "0.0.0.0/0"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-name"
    value = lower("${var.team}-${var.environment}-eks-lb")
  }
}

#########
# create all Namespaces into EKS
resource "kubernetes_namespace" "eks_namespaces" {
  for_each = toset(var.namespaces)

  metadata {
    annotations = {
      name = each.key
    }
    name = each.key
  }
}
