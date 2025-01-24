terraform {
  required_version = ">=1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 3.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.0"
    }
    ansible = {
      source  = "ansible/ansible"
      version = "1.3.0"
    }
  }
}
provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
resource "tls_private_key" "rsa_4096_example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa_4096_example.public_key_openssh
}
resource "local_file" "private_key" {
  content  = tls_private_key.rsa_4096_example.private_key_pem
  filename = var.private_key_filename
}
resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.key_pair.key_name

  tags = {
    Name = "RNJ"
  }

}
resource "ansible_host" "web" {
  count  = length(aws_instance.web)
  name   = "web"
  groups = ["web"]
  variables = {
    ansible_host = aws_instance.web.public_ip
    ansible_user = var.ansible_user
  }
}

resource "ansible_group" "web" {
  name     = "web"
  children = []
  variables = {
    ansible_ssh_private_key_file = var.private_key_filename
  }
}

