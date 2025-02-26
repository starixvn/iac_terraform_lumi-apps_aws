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
      values = ["10.10.50.145", ]
    },
    {
      # Kube API K3S-LUMPROD
      name   = "vn-sc-ing-lumprod-api",
      values = ["10.10.50.120", ]
    },
    {
      # Kube Ingress K3S-LUMPROD
      name   = "vn-sc-ing-lumprod",
      values = ["10.10.50.121", ]
    },
    {
      # Kube API K8S-SC-LOCAL
      name   = "vn-sc-ing-local-api",
      values = ["10.10.50.144", ]
    },
    {
      # Kube Ingress K8S-SC-LOCAL
      name   = "vn-sc-ing-local",
      values = ["10.10.50.145", ]
    },
    {
      # Kube API K8S-ST-BACKUP
      name   = "vn-st-ing-backup-api",
      values = ["10.10.50.136", ]
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
    {
      # HAP SC LOCAL
      name   = "vn-sc-hap-local",
      values = ["10.10.50.69", ]
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
      name   = "d1aof1lwumql9k",
      type   = "CNAME"
      values = ["d1aof1lwumql9k.cloudfront.net", ]
    },
    {
      # Collect Autotest Report
      name   = "test-reports",
      values = ["10.10.50.160", ]
    },
    {
      # NATS on LUMPROD
      name   = "nats",
      values = ["10.10.50.122", ]
    },
  ]

  "luminetsoft.com" = [
    {
      # Wildcard mapping
      name   = "*",
      values = ["10.10.50.145", ]
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
      # HAP SC LOCAL
      name   = "vn-sc-hap-local",
      values = ["10.10.50.69", ]
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
        "penpot",
        "vn-lu-ing-k3slocal",
        "openproject",
        "nui",
        "sentry-k8s",
        "rancher",
      ]
    },
    {
      # 10.10.50.145 - K8S SC LOCAL
      canonical_name = "vn-sc-ing-local.lumigame.com"
      cname_records = [
        "deployapi-k8s",
        "ing-stat",
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
        "haproxy-gw",
        "haproxy-k8s",
        "awsapi",
        "deployapi-aws",
        "deployapi-eks",
        "echo",
        "echo2",
        "eks-ingress",
        "eks-zabbix",
        "es",
        "jaeger-collector-eks",
        "notification-bot",
        "portainereks",
        "vn-zabbix",
      ]
    },
    {
      # 10.10.50.69 - HAP SC LOCAL
      canonical_name = "vn-sc-hap-local.lumigame.com"
      cname_records = [
        "haproxy",
        "deploy",
        "sentry",
        "sonarqube",
        "rocketor-api",
      ]
    },

    {
      # 202.78.231.54 - WAN LUMPROD
      canonical_name = "vn-sc-wan-lumprod.lumigame.com"
      cname_records = [
        "hub",
        "hubbk",
        "npm",
        "n8n"
      ]
    },
    {
      # 202.78.231.51 - WAN SWARM SC LOCAL
      canonical_name = "vn-sc-wan-swlocal.lumigame.com",
      cname_records = [
        "chinese-poker",
        "whoami",
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
        "pusoy",
        "bots",
        "l1-admin1",
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
        "haproxy-k8s"
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

