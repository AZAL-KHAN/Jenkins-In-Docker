# AWS / Provider

variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "eu-north-1"
}

# EC2 Configuration

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-073130f74f5ffb161"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
  default     = "iac-key"
}

variable "public_key_path" {
  description = "Path to the public SSH key"
  type        = string
  default     = "/home/mrask/.ssh/iac-key.pub"
}

# Networking

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability Zone for the subnet"
  type        = string
  default     = "eu-north-1a"
}

# Environment / Tags
variable "environment" {
  description = "Deployment environment (dev, stage, prod)"
  type        = string
  default     = "dev"
}

# Root Volume

variable "root_volume_size" {
  description = "Root EBS volume size in GB"
  type        = number
  default     = 10
}

variable "root_volume_type" {
  description = "Root EBS volume type"
  type        = string
  default     = "gp3"
}
