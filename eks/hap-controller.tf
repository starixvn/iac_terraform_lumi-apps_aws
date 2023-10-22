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
    value = "${local.environment}-${local.team}-eks-lb"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-additional-resource-tags"
    value = "owner=gvh-ram,environment=dev,type=istio-gateway"
    #"Dept=VNTeam, Team=${local.team}, ManageBy=vnTerraform, Environment=${local.environment}"
  }

}
/*
"service.beta.kubernetes.io/aws-load-balancer-name": "eks-lb"
"service.beta.kubernetes.io/aws-load-balancer-type": "nlb"
"service.beta.kubernetes.io/aws-load-balancer-scheme": "internet-facing"
"service.beta.kubernetes.io/aws-load-balancer-connection-idle-timeout": 360
"service.beta.kubernetes.io/aws-load-balancer-additional-resource-tags": "Dept=VNTeam, Team=${local.team}, ManageBy=vnTerraform, Environment=${local.environment}"
  #service.beta.kubernetes.io/aws-load-balancer-backend-protocol:
  #https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.3/guide/service/annotations/#backend-protocol
  #
*/