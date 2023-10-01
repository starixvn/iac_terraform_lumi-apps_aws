terraform {
  required_version = ">= 1.4" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.1"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.4"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.2"
    }
  }
  
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
  }
}

provider "aws" {
  region = var.aws_region
  #  profile = var.aws_profile #for debug testing
  default_tags {
    tags = {
      Dept = "VNTeam"
      #Team = "VNTeam"
    }
  }
}