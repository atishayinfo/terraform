# Define the required variables for the Terraform configuration

variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
}

variable "key_pair_name" {
  description = "Key Pair Name"
  type        = string
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}

variable "volume_size" {
  description = "Volume Size in GB"
  type        = number
}

variable "volume_type" {
  description = "Volume Type"
  type        = string
}

variable "instance_name" {
  description = "EC2 Instance Name"
  type        = string
}
