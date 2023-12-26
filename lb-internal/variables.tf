
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

variable "aws_region_bucket_remote_state_vn" {
  description = "aws_region_bucket VN"
  type        = string
}

variable "aws_region_key_sg_remote_state_vn" {
  description = "sg_remote_state VN"
  type        = string
}

variable "team" {
  type = string
}
variable "proxy_gw_vm" {
  description = "EC2 configuration"
  default     = [{}]
}
variable "web_server_configuration" {
  description = "EC2 configuration"
  default     = [{}]
}
###VPC
variable "vpc_id" {
  description = "vpc_id"
  type = string 
}

# VPC Private Subnets
variable "vpc_private_subnets" {
  description = "SC - VPC Private Subnets"
  type = list(string)
}
