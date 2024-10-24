variable "region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "eu-north-1" # Default value can be changed
}

variable "vpc_id" {
  description = "The ID of the existing VPC"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the existing subnet"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to create"
  type        = string
  default     = "t2.micro" # Default instance type
}

variable "key_pair_name" {
  description = "The name of the key pair to use for the instance"
  type        = string
}

variable "ingress_cidr_blocks" {
  description = "CIDR blocks for ingress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"] # Open to the world (adjust as necessary)
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
  default     = "allow-ssh"
}

variable "volume_size" {
  description = "Size of the root volume in GB"
  type        = number
  default     = 20 # Default size can be changed
}

variable "volume_type" {
  description = "Type of the root volume"
  type        = string
  default     = "gp2" # General Purpose SSD
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "MyEC2Instance"
}
