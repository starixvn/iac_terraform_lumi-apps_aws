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
      "record" : "10.10.50.145",
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
    {
      "name" : "gitgd",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.121",
    },
    {
      "name" : "git21",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.121",
    },
    {
      "name" : "argocd2",
      "type" : "A",
      "ttl" : "3600",
      "record" : "127.0.0.1",
    },
    {
      "name" : "argocd",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.121",
    },
    {
      "name" : "npm-k3s",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.121",
    },
    {
      "name" : "vault",
      "type" : "A",
      "ttl" : "300",
      "record" : "10.10.50.121",
    },
    {
      "name" : "hub-k3s",
      "type" : "A",
      "ttl" : "300",
      "record" : "10.10.50.121",
    },
    {
      "name" : "logs",
      "type" : "A",
      "ttl" : "300",
      "record" : "10.10.50.121",
    },
    {
      "name" : "trivy",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.121",
    },
    {
      "name" : "portainer",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.121",
    },
    {
      "name" : "longhorn",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.121",
    },
    {
      "name" : "minio-api",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.128",
    },
    {
      "name" : "s3-api",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.137",
    },
    {
      "name" : "hub-main",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.121",
    },
    {
      "name" : "hub-bk",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.121",
    },
    {
      "name" : "jaeger-elasticsearch-k3s",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.121",
    },
    {
      "name" : "jaeger-k3s",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.121",
    },
    {
      "name" : "jaeger",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.121",
    },
    {
      "name" : "grafana",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.121",
    },
    {
      "name" : "npm",
      "type" : "A",
      "ttl" : "3600",
      "record" : "202.78.231.54",
    },
    {
      "name" : "l1-sedie-client-demo1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "202.78.231.34",
    },
    {
      "name" : "gn-core-client-demo",
      "type" : "A",
      "ttl" : "3600",
      "record" : "202.78.231.34",
    },
    {
      "name" : "gn-proxy",
      "type" : "A",
      "ttl" : "3600",
      "record" : "202.78.231.34",
    },
    {
      "name" : "gn-gamelobby-simulator",
      "type" : "A",
      "ttl" : "3600",
      "record" : "202.78.231.34",
    },
    {
      "name" : "gn-owapi-simulator",
      "type" : "A",
      "ttl" : "3600",
      "record" : "202.78.231.34",
    },
    {
      "name" : "rocketchat",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.121",
    },
    {
      "name" : "gn-mini",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "gn-mini1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "minio",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.121",
    },
    {
      "name" : "minio-console",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.121",
    },
    {
      "name" : "gn-mini-1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "gn-mini-2",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "gn-mini-3",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "penpot",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.121",
    },
    {
      "name" : "sk-gamelobby-simulator",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "sk-result",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "sk-api",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "sk-guide",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "sk-game",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "sk-owapi-simulator",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "sk-auth",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "sk-game-1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "sk-game-2",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "sk-game-3",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "l1-guide1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "l1-direct-game-client1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.100",
    },
    {
      "name" : "sk-guide1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "admin",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "admin-api",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "api",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "auth",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "gamelobby-simulator",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "games",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-admin-api1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-admin-api3",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-admin1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-admin3",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-api1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-api3",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-appdownload",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-appdownload1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-appdownload3",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-auth1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-auth3",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-connectapi1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-connectapi3",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-connectsite1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-connectsite3",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-games1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-games3",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-glbs3",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-guide",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-guide-1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-guide-3",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-gw",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-gw1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-gw3",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-info",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-info1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-info3",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-keno",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-keno1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-keno3",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-m",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-m1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-m3",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-mini",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-mini1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-mini3",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-ows3",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-proxy",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-proxy3",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-result1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-result3",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "owapi-simulator",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "result",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "l1-proxy1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "202.78.231.34",
    },
    {
      "name" : "l1-glbs1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "202.78.231.34",
    },
    {
      "name" : "l1-ows1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "202.78.231.34",
    },
    {
      "name" : "gn-api",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "gn-auth",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "gn-result",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "gn-admin-api",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "gn-admin",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "gn-guide",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "gn-api1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "gn-ows1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "gn-glbs1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "gn-auth1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "gn-proxy1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "gn-admin-api1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "gn-result1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "gn-admin1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "gn-guide1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "gn-game-1",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
    },
    {
      "name" : "gn-game",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.145",
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
      "name" : "trivy",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.121",
    },
    {
      "name" : "portainer",
      "type" : "A",
      "ttl" : "3600",
      "record" : "10.10.50.121",
    },
  ],
}


domain_alias_records = {
  "lumigame.com" = [
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
    # {
    #   "name" : "argocd",
    #   "type" : "A",
    # },
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
      "name" : "notification-bot",
      "type" : "A",
    },
    {
      "name" : "l1-client",
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

