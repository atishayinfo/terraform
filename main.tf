provider "aws" {
  region = var.region
}

# Use existing VPC
data "aws_vpc" "existing" {
  id = var.vpc_id
}

# Use existing Subnet
data "aws_subnet" "existing" {
  id = var.subnet_id
}

# Create a security group
resource "aws_security_group" "allow_ssh" {
  vpc_id = data.aws_vpc.existing.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ingress_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}

# Create an EC2 instance
resource "aws_instance" "my_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_pair_name
  subnet_id     = data.aws_subnet.existing.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  associate_public_ip_address = true

  tags = {
    Name = var.instance_name
  }

  # Block device mapping for storage configuration
  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    delete_on_termination = true
  }
}

output "instance_id" {
  value = aws_instance.my_instance.id
}

output "public_ip" {
  value = aws_instance.my_instance.public_ip
}
