project = "cloud"
team = "Lumi"
aws_region = "ap-east-1"
environment = "local"
aws_profile = "local-iac-terraform-ci"
aws_region_bucket_remote_state = "cloud-lumi-starix-tf-goshawk"
aws_region_key_remote_state    = "env:/local/vpc-terraform.tfstate"
aws_region_key_remote_state_zone    = "env:/local/route53-tf.tfstate"
aws_region_key_remote_state_lb    = "env:/local/lumi-lb-external-tf.tfstate"

############### Route53
domain_ns_records = [
  {
    "zone_id" : "lumigame.com",
    "name_servers" : "staging.lumigame.com",
    "name" : "staging",
    "type" : "NS",
    "ttl" : "86400",
  },
]

domain_a_records = {
  "lumigame.com" = [
    {
          "name" : "*",
          "type" : "A",
          "ttl" : "3600",
          "record" : "10.10.50.39",
    },
    {
          "name" : "l1-appdownload",
          "type" : "A",
          "ttl" : "3600",
          "record" : "16.162.127.204",
    },
    {
          "name" : "l1-info",
          "type" : "A",
          "ttl" : "3600",
          "record" : "16.162.127.204",
    },
    {
          "name" : "l1-keno",
          "type" : "A",
          "ttl" : "3600",
          "record" : "16.162.127.204",
    },
    {
          "name" : "l1-m",
          "type" : "A",
          "ttl" : "3600",
          "record" : "16.162.127.204",
    },
    {
          "name" : "games",
          "type" : "A",
          "ttl" : "3600",
          "record" : "16.162.127.204",
    },
    {
          "name" : "l1-mini",
          "type" : "A",
          "ttl" : "3600",
          "record" : "16.162.127.204",
    },
    {
          "name" : "l1-mongoexpress-aws",
          "type" : "A",
          "ttl" : "3600",
          "record" : "16.162.127.204",
    },
    {
          "name" : "hub",
          "type" : "A",
          "ttl" : "3600",
          "record" : "202.78.231.54",
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
  ],
  "staging.lumigame.com" = [
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
}
