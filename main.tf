provider "aws" {
  region = var.aws_region
}

locals {
  env = terraform.workspace
}

resource "aws_security_group" "web_sg" {
  name        = "${local.env}-web-sg"
  description = "Security group for web server"

  ingress {
    description = "Allow SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    description = "Allow HTTP from internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${local.env}-web-sg"
    Environment = local.env
    Project     = "TerraformDriftAssignment"
  }
}

resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name        = "${local.env}-web-server"
    Environment = local.env
    Project     = "TerraformDriftAssignment"
  }
}