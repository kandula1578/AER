variable "project" {
  description = "The name of the current project."
  type        = string
  default     = "capstone"
}

variable "vpc_cidr" {
  type        = string
  default     = "190.160.0.0/16"
}

variable "subnet_a_cidr" {
  type        = string
  default     = "190.160.1.0/26"
}

variable "subnet_b_cidr" {
  type        = string
  default     = "190.160.2.0/26"
}

variable "az_a" {
  type        = string
  default     = "us-east-1a"
}

variable "az_b" {
  type        = string
  default     = "us-east-1b"
}

variable "region" {
  type = string
  description = "The AWS region to deploy resources in"
  default = "us-east-1"
}
