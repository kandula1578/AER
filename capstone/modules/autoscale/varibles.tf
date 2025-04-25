variable "image_id" {
  type = string
  description = "Value for Image-id"
  default = "ami-0b86aaed8ef90e45f"
}

variable "project" {
  type = string
  default = "capstone"
}

variable "instance_type" {
  type = string
  default  = "t2-micro"
}

variable "security_group_id" {
  type = string
}

variable "add_public_ip" {
  type    = bool
  default = true
}

variable "subnet_a_id" {
  type = string
}

variable "subnet_b_id" {
  type = string
}

variable "region" {
  type = string
  description = "The AWS region to deploy resources in"
  default = "us-east-1"
}

variable "startup_script" {
  type = string
  description = "The name of the startup script file"
}

variable "instance_count_min" {
  type = number
  description = "The minimum number of instances in the autoscaling group"
  default     = 1
}

variable "instance_count_max" {
  description = "Number of instances to provision."
  type        = number
  default     = 2
}

variable "load_balancer_id" {
  type = string
}


