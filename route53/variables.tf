variable "aws_region" {
  description = "aws region"
  type        = string
}

variable "aws_profile" {
  description = "aws profile"
  type        = string
}

# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
}

variable "team" {
  description = "Team name"
  type        = string
}

variable "project" {
  type = string
}

variable "aws_region_bucket_remote_state" {
  description = "aws_region_bucket"
  type        = string
}
variable "aws_region_key_remote_state" {
  description = "aws_region_key"
  type        = string
}

variable "aws_region_key_remote_state_zone" {
  type = string
}
variable "aws_region_key_remote_state_lb" {
  type = string
}

#######ROUTE 53
variable "domain_a_records" {
  description = "A records"
  default     = [{}]
}
variable "domain_alias_records" {
  description = "Alias records"
  default     = [{}]
}
variable "domain_ns_records" {
  description = "domain ns records"
  default     = [{}]
}
