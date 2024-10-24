provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_pair_name
  subnet_id     = var.subnet_id

  tags = {
    Name = var.instance_name
  }

  vpc_security_group_ids = [
    aws_security_group.sg.id
  ]

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  associate_public_ip_address = true
}

resource "aws_security_group" "sg" {
  name        = var.security_group_name
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
