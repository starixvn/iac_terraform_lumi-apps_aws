# get EKS authentication for being able to manage k8s objects from terraform
# deploy spot termination handler
resource "helm_release" "spot_termination_handler" {
/*  depends_on = [
    module.cluster
 ]*/
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
  version    = "1.33.1"
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
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-subnets"
    type  = "string"
    value = var.lb_subnets
    #value = join(",", data.terraform_remote_state.vpc.outputs.private_subnet_ids)
  }

  # set {
  #   name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-private-ipv4-addresses"
  #   type  = "string"
  #   value = var.lb_private_ips
  # }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-name"
    value = lower("${var.team}-${var.environment}-eks-lb")
  }
}

#########
# create all Namespaces into EKS
resource "kubernetes_namespace" "eks_namespaces" {
/*  depends_on = [
    module.cluster
 ]*/
  for_each = toset(var.namespaces)

  metadata {
    annotations = {
      name = each.key
    }
    name = each.key
  }
}
