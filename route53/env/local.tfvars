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

main_records = {
  "lumigame.com" = [
    {
      # Wildcard mapping
      name   = "*",
      values = ["10.10.50.69", ] #202.78.231.62
    },
    {
      # Kube Ingress K3S-LUMPROD
      name   = "vn-sc-ing-lumprod",
      values = ["10.10.50.121", ]
    },
    {
      # Kube Ingress K8S-SC-LOCAL
      name   = "vn-sc-ing-local",
      values = ["10.10.50.145", ]
    },
    {
      # Kube Ingress K8S-ST-BACKUP
      name   = "vn-st-ing-backup",
      values = ["10.10.50.137", ]
    },
    {
      # HAP CORE
      name   = "vn-sc-hap-core",
      values = ["10.10.50.100", ]
    },

    ###########################################
    ############### WAN MAPPING ###############
    {
      # WAN LUMPROD
      name   = "vn-sc-wan-lumprod",
      values = ["202.78.231.54", ]
    },
    {
      # WAN SWARM SC LOCAL
      name   = "vn-sc-wan-swlocal",
      values = ["202.78.231.51", ]
    },
    {
      # WAN K8S SC LOCAL
      name   = "vn-sc-wan-local",
      values = ["202.78.231.34", ]
    },

    ###########################################
    ############### EXT MAPPING ###############
    {
      name   = "minio-api",
      values = ["10.10.50.128", ]
    },
    {
      name   = "d1aof1lwumql9k",
      type   = "CNAME"
      values = ["d1aof1lwumql9k.cloudfront.net", ]
    }
  ]

  "luminetsoft.com" = [
    {
      # Wildcard mapping
      name   = "*",
      values = ["10.10.50.69", ] #202.78.231.62
    },
    {
      # Kube Ingress K3S-LUMPROD
      name   = "vn-sc-ing-lumprod",
      values = ["10.10.50.121", ]
    },
    {
      # HAP CORE
      name   = "vn-sc-hap-core",
      values = ["10.10.50.100", ]
    },

    {
      # WAN LUMPROD
      name   = "vn-sc-wan-lumprod",
      values = ["202.78.231.54", ]
    },
    {
      # WAN SWARM SC LOCAL
      name   = "vn-sc-wan-swlocal",
      values = ["202.78.231.51", ]
    }
  ]
}


cluster_cname_records = {
  "lumigame.com" = [
    {
      # 10.10.50.121 - K3S LUMPROD 
      canonical_name = "vn-sc-ing-lumprod.lumigame.com"
      cname_records = [
        "gitgd",
        "git21",
        "argocd",
        "npm-k3s",
        "vault",
        "hub-k3s",
        "logs",
        "trivy",
        "portainer",
        "longhorn",
        "hub-main",
        "hub-bk",
        "jaeger-elasticsearch-k3s",
        "jaeger-k3s",
        "jaeger",
        "grafana",
        "rocketchat",
        "minio",
        "minio-console",
        "penpot",
        "vn-lu-ing-k3slocal",
      ]
    },
    {
      # 10.10.50.145 - K8S SC LOCAL
      canonical_name = "vn-sc-ing-local.lumigame.com"
      cname_records = [
        "admin",
        "admin-api",
        "api",
        "auth",
        "deployapi-k8s",
        "gamelobby-simulator",
        "games",
        "gn-admin",
        "gn-admin-api",
        "gn-admin-api1",
        "gn-admin1",
        "gn-api",
        "gn-api1",
        "gn-auth",
        "gn-auth1",
        "gn-game",
        "gn-game-1",
        "gn-glbs1",
        "gn-guide",
        "gn-guide1",
        "gn-mini",
        "gn-mini-1",
        "gn-ows1",
        "gn-proxy1",
        "gn-result",
        "gn-result1",
        "ing-stat",
        "l1-admin-api1",
        "l1-admin-api3",
        "l1-admin1",
        "l1-admin3",
        "l1-api1",
        "l1-api3",
        "l1-appdownload",
        "l1-appdownload1",
        "l1-appdownload3",
        "l1-auth1",
        "l1-auth3",
        "l1-connectapi1",
        "l1-connectapi3",
        "l1-connectsite1",
        "l1-connectsite3",
        "l1-direct-game-client1",
        "l1-games1",
        "l1-games3",
        "l1-glbs3",
        "l1-guide",
        "l1-guide-1",
        "l1-guide-3",
        "l1-gw",
        "l1-gw1",
        "l1-gw3",
        "l1-info",
        "l1-info1",
        "l1-info3",
        "l1-keno",
        "l1-keno1",
        "l1-keno3",
        "l1-m",
        "l1-m1",
        "l1-m3",
        "l1-mini",
        "l1-mini1",
        "l1-mini3",
        "l1-ows3",
        "l1-proxy",
        "l1-proxy3",
        "l1-result1",
        "l1-result3",
        "maintenance",
        "owapi-simulator",
        "result",
        "site-testingken",
        "sk-game",
        "sk-game-1",
        "sk-guide",
        "sk-guide1",
      ]
    },
    {
      # 10.10.50.137 - K3S ST BACKUP
      canonical_name = "vn-st-ing-backup.lumigame.com"
      cname_records = [
        "s3-api",
      ]
    },
    {
      # 10.10.50.100 - HAP CORE
      canonical_name = "vn-sc-hap-core.lumigame.com"
      cname_records = [
        "gn-mini-2",
        "gn-mini-3",
        "gn-mini1",
        "haproxy-gw",
        "haproxy-k8s",
        "l1-guide1",
        "sk-api",
        "sk-auth",
        "sk-game-2",
        "sk-game-3",
        "sk-gamelobby-simulator",
        "sk-owapi-simulator",
        "sk-result",
        "t1",
        "t2",
        "awsapi",
        "deployapi-aws",
        "deployapi-eks",
        "echo",
        "echo2",
        "eks-ingress",
        "eks-zabbix",
        "es",
        "gn-game-2",
        "gn-game-3",
        "haproxy",
        "jaeger-collector-eks",
        "l1-admin-api-public",
        "l1-aws-game-api",
        "l1-client",
        "l1-history",
        "l1-mongoexpress-aws",
        "l1-services",
        "notification-bot",
        "portainereks",
        "vn-zabbix",
        "w1",
        "w2",
      ]
    },

    {
      # 202.78.231.54 - WAN LUMPROD
      canonical_name = "vn-sc-wan-lumprod.lumigame.com"
      cname_records = [
        "hub",
        "hubbk",
        "npm"
      ]
    },
    {
      # 202.78.231.51 - WAN SWARM SC LOCAL
      canonical_name = "vn-sc-wan-swlocal.lumigame.com",
      cname_records = [
        "bots",
        "chinese-poker",
        "whoami",
        "pusoy"
      ]
    },
    {
      # 202.78.231.34 - WAN K8S SC LOCAL
      canonical_name = "vn-sc-wan-local.lumigame.com",
      cname_records = [
        "gn-core-client-demo",
        "gn-gamelobby-simulator",
        "gn-owapi-simulator",
        "gn-proxy",
        "l1-glbs1",
        "l1-ows1",
        "l1-proxy1",
        "l1-sedie-client-demo1",
      ]
    }
  ],

  "luminetsoft.com" = [
    {
      # 10.10.50.121 - Kube Ingress K3S-LUMPROD
      canonical_name = "vn-sc-ing-lumprod.luminetsoft.com"
      cname_records = [
        "trivy",
        "portainer"
      ]
    },
    {
      # 10.10.50.100 - HAP CORE
      canonical_name = "vn-sc-hap-core.luminetsoft.com"
      cname_records = [
        "deployapi-k8s",
        "haproxy-gw",
        "haproxy-k8s",
        "t1",
        "t2",
        "admin",
        "admin-api",
        "api",
        "auth",
        "awsapi",
        "gamelobby-simulator",
        "games",
        "gn-admin",
        "gn-admin-api",
        "gn-auth",
        "gn-game",
        "gn-game-1",
        "gn-game-2",
        "gn-game-3",
        "gn-gamelobby-simulator",
        "gn-guide",
        "gn-proxy",
        "l1-admin-api-public",
        "l1-appdownload",
        "l1-aws-game-api",
        "l1-client",
        "l1-guide",
        "l1-gw",
        "l1-history",
        "l1-info",
        "l1-keno",
        "l1-m",
        "l1-mini",
        "l1-mongoexpress-aws",
        "l1-proxy",
        "l1-services",
        "notification-bot",
        "owapi-simulator",
        "result",
      ]
    },

    {
      # 202.78.231.54 - WAN LUMPROD
      canonical_name = "vn-sc-wan-lumprod.luminetsoft.com",
      cname_records = [
        "hub",
        "hubbk"
      ]
    },
    {
      # 202.78.231.51 - WAN SWARM SC LOCAL
      canonical_name = "vn-sc-wan-swlocal.luminetsoft.com",
      cname_records = [
        "bots",
        "chinese-poker",
        "whoami"
      ]
    }
  ]
}

