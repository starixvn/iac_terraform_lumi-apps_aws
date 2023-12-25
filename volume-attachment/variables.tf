
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
variable "aws_region_bucket_remote_state_vn" {
  description = "aws_region_bucket"
  type        = string
}
variable "aws_region_key_ec2_remote_state_vn" {
  description = "ec2_remote_state"
  type        = string
}

variable "team" {
  type = string
}

variable "availability_zone" {
  type = string
}