
variable "project" {
  type = string
}
variable "aws_profile" {
  description = "aws profile"
  type        = string
}
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
}

variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "ap-northeast-1"
}
variable "aws_region_bucket_remote_state" {
  description = "aws_region_bucket"
  type        = string
}
variable "aws_region_key_remote_state" {
  description = "aws_region_key"
  type        = string
}

variable "team" {
  type = string
}
variable "proxy_gw_vm" {
  description = "EC2 configuration"
  default     = [{}]
}
variable "apps_vm" {
  description = "EC2 configuration"
  default     = [{}]
}

variable "private_key_location" {
  type = any
}

variable "public_key_location" {
  type = any
}
variable "ami_name" {
  default = "ubuntu22"

  validation {
    condition     = can(regex("amazon|suse|RHEL|ubuntu|windows", var.ami_name))
    error_message = "Invalid ami name, allowed_values = [amazon suse RHEL ubuntu]."
  }
}

variable "nlb_proxy_gw" {
  type        = string
  description = "NLB type"
}