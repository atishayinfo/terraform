# Specify the required Terraform version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.73" # Ensure this matches your requirements
    }
  }

  required_version = ">= 1.0" # Specify the minimum required version of Terraform
}

# Configure the AWS provider using variables
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
}

# Create an EC2 instance
resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_pair_name
  subnet_id     = var.subnet_id

  tags = {
    Name = var.instance_name
  }

  vpc_security_group_ids = [
    var.security_group_id  # Reference the existing security group ID from variables
  ]

  # Define the root block device settings
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  associate_public_ip_address = true # Assign a public IP address to the instance
}
