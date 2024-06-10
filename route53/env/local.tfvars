project                          = "cloud"
team                             = "Lumi"
aws_region                       = "ap-east-1"
environment                      = "local"
aws_profile                      = "local-iac-terraform-ci"
aws_region_bucket_remote_state   = "cloud-lumi-starix-tf-goshawk"
aws_region_key_remote_state      = "env:/local/vpc-terraform.tfstate"
aws_region_key_remote_state_zone = "env:/local/route53-tf.tfstate"
aws_region_key_remote_state_lb   = "env:/local/lumi-lb-external-tf.tfstate"

############## Route53
domain_ns_records = [
  /*{
    "zone_id" : "lumigame.com",
    "name_servers" : "staging.lumigame.com",
    "name" : "staging",
    "type" : "NS",
    "ttl" : "86400",
  },*/
]

domain_a_records = {
  "lumigame.com" = [
    {
      "name" : "*",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.69", #202.78.231.62
    },
    {
      "name" : "hub",
      "type" : "A",
      "ttl" : "3600",
      "record" : "202.78.231.54",
    },
    {
      "name" : "deployapi-k8s",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "argocd-local",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "bots",
      "type" : "A",
      "ttl" : "3600",
      "record" : "202.78.231.51",
    },
    {
      "name" : "chinese-poker",
      "type" : "A",
      "ttl" : "3600",
      "record" : "202.78.231.51",
    },
    {
      "name" : "argocd-local-1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "haproxy-k8s",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "haproxy-gw",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "t1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "t2",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "hubbk",
      "type" : "A",
      "ttl" : "3600",
      "record" : "202.78.231.54",
    },
    {
      "name" : "whoami",
      "type" : "A",
      "ttl" : "3600",
      "record" : "202.78.231.51",
    },
    {
      "name" : "pusoy",
      "type" : "A",
      "ttl" : "3600",
      "record" : "202.78.231.51",
    },
  ],
  "luminetsoft.com" = [
    {
      "name" : "*",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.69", #202.78.231.62
    },
    {
      "name" : "hub",
      "type" : "A",
      "ttl" : "3600",
      "record" : "202.78.231.54",
    },
    {
      "name" : "deployapi-k8s",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "argocd-local",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "bots",
      "type" : "A",
      "ttl" : "3600",
      "record" : "202.78.231.51",
    },
    {
      "name" : "chinese-poker",
      "type" : "A",
      "ttl" : "3600",
      "record" : "202.78.231.51",
    },
    {
      "name" : "argocd-local-1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "haproxy-k8s",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "haproxy-gw",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "t1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "t2",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "hubbk",
      "type" : "A",
      "ttl" : "3600",
      "record" : "202.78.231.54",
    },
    {
      "name" : "whoami",
      "type" : "A",
      "ttl" : "3600",
      "record" : "202.78.231.51",
    },
  ],
}


domain_alias_records = {
  "lumigame.com" = [
    {
      "name" : "l1-appdownload",
      "type" : "A",
    },
    {
      "name" : "l1-info",
      "type" : "A",
    },
    {
      "name" : "l1-keno",
      "type" : "A",
    },
    {
      "name" : "l1-m",
      "type" : "A",
    },
    {
      "name" : "games",
      "type" : "A",
    },
    {
      "name" : "l1-mini",
      "type" : "A",
    },
    {
      "name" : "w1",
      "type" : "A",
    },
    {
      "name" : "w2",
      "type" : "A",
    },
    {
      "name" : "echo",
      "type" : "A",
    },
    {
      "name" : "echo2",
      "type" : "A",
    },
    {
      "name" : "haproxy",
      "type" : "A",
    },
    {
      "name" : "deployapi-aws",
      "type" : "A",
    },
    {
      "name" : "eks-ingress",
      "type" : "A",
    },
    {
      "name" : "deployapi-eks",
      "type" : "A",
    },
    {
      "name" : "portainereks",
      "type" : "A",
    },
    {
      "name" : "grafana",
      "type" : "A",
    },
    {
      "name" : "eks-zabbix",
      "type" : "A",
    },
    {
      "name" : "l1-history",
      "type" : "A",
    },
    {
      "name" : "vn-zabbix",
      "type" : "A",
    },
    {
      "name" : "l1-admin-api-public",
      "type" : "A",
    },
    {
      "name" : "l1-mongoexpress-aws",
      "type" : "A",
    },
    {
      "name" : "l1-aws-game-api",
      "type" : "A",
    },
    {
      "name" : "l1-services",
      "type" : "A",
    },
    {
      "name" : "logs",
      "type" : "A",
    },
    {
      "name" : "argocd",
      "type" : "A",
    },
    {
      "name" : "jaeger-collector-eks",
      "type" : "A",
    },
    {
      "name" : "es",
      "type" : "A",
    },
    {
      "name" : "awsapi",
      "type" : "A",
    },
    {
      "name" : "gn-admin-api",
      "type" : "A",
    },
    {
      "name" : "gn-admin",
      "type" : "A",
    },
    {
      "name" : "gn-proxy",
      "type" : "A",
    },
    {
      "name" : "gn-guide",
      "type" : "A",
    },
    {
      "name" : "gn-gamelobby-simulator",
      "type" : "A",
    },
    {
      "name" : "gn-resul",
      "type" : "A",
    },
    {
      "name" : "gn-ap",
      "type" : "A",
    },
    {
      "name" : "gn-auth",
      "type" : "A",
    },
    {
      "name" : "gn-game",
      "type" : "A",
    },
    {
      "name" : "auth",
      "type" : "A",
    },
    {
      "name" : "api",
      "type" : "A",
    },
    {
      "name" : "admin",
      "type" : "A",
    },
    {
      "name" : "admin-api",
      "type" : "A",
    },
    {
      "name" : "gamelobby-simulator",
      "type" : "A",
    },
    {
      "name" : "owapi-simulator",
      "type" : "A",
    },
    {
      "name" : "result",
      "type" : "A",
    },
    {
      "name" : "l1-gw",
      "type" : "A",
    },
    {
      "name" : "l1-guide",
      "type" : "A",
    },
    {
      "name" : "notification-bot",
      "type" : "A",
    },
    {
      "name" : "l1-proxy",
      "type" : "A",
    },
    {
      "name" : "l1-client",
      "type" : "A",
    },
    {
      "name" : "gn-game-1",
      "type" : "A",
    },
    {
      "name" : "gn-game-2",
      "type" : "A",
    },
    {
      "name" : "gn-game-3",
      "type" : "A",
    },
  ],
  "luminetsoft.com" = [
    {
      "name" : "l1-appdownload",
      "type" : "A",
    },
    {
      "name" : "l1-info",
      "type" : "A",
    },
    {
      "name" : "l1-keno",
      "type" : "A",
    },
    {
      "name" : "l1-m",
      "type" : "A",
    },
    {
      "name" : "games",
      "type" : "A",
    },
    {
      "name" : "l1-mini",
      "type" : "A",
    },
    {
      "name" : "l1-history",
      "type" : "A",
    },
    {
      "name" : "l1-admin-api-public",
      "type" : "A",
    },
    {
      "name" : "l1-mongoexpress-aws",
      "type" : "A",
    },
    {
      "name" : "l1-aws-game-api",
      "type" : "A",
    },
    {
      "name" : "l1-services",
      "type" : "A",
    },

    {
      "name" : "awsapi",
      "type" : "A",
    },
    {
      "name" : "gn-admin-api",
      "type" : "A",
    },
    {
      "name" : "gn-admin",
      "type" : "A",
    },
    {
      "name" : "gn-proxy",
      "type" : "A",
    },
    {
      "name" : "gn-guide",
      "type" : "A",
    },
    {
      "name" : "gn-gamelobby-simulator",
      "type" : "A",
    },
    {
      "name" : "gn-resul",
      "type" : "A",
    },
    {
      "name" : "gn-ap",
      "type" : "A",
    },
    {
      "name" : "gn-auth",
      "type" : "A",
    },
    {
      "name" : "gn-game",
      "type" : "A",
    },
    {
      "name" : "auth",
      "type" : "A",
    },
    {
      "name" : "api",
      "type" : "A",
    },
    {
      "name" : "admin",
      "type" : "A",
    },
    {
      "name" : "admin-api",
      "type" : "A",
    },
    {
      "name" : "gamelobby-simulator",
      "type" : "A",
    },
    {
      "name" : "owapi-simulator",
      "type" : "A",
    },
    {
      "name" : "result",
      "type" : "A",
    },
    {
      "name" : "l1-gw",
      "type" : "A",
    },
    {
      "name" : "l1-guide",
      "type" : "A",
    },
    {
      "name" : "notification-bot",
      "type" : "A",
    },
    {
      "name" : "l1-proxy",
      "type" : "A",
    },
    {
      "name" : "l1-client",
      "type" : "A",
    },
    {
      "name" : "gn-game-1",
      "type" : "A",
    },
    {
      "name" : "gn-game-2",
      "type" : "A",
    },
    {
      "name" : "gn-game-3",
      "type" : "A",
    },
  ],
  /*"staging.lumigame.com" = [
    {
        "name" : "w1",
        "type" : "A",
    },
    {
        "name" : "w2",
        "type" : "A",
    },
    {
        "name" : "w1-api",
        "type" : "A",
    },
  ],
  */
}
