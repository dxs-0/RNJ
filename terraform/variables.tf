variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
}

variable "region" {
  description = "AWS region for the resources"
  type        = string
  default     = "eu-central-1"
}

variable "key_name" {
  description = "Name of the key pair"
  type        = string
}

variable "private_key_filename" {
  description = "Filename for storing the private key locally"
  type        = string
  default     = "my_key_pair.pem"
}

variable "ami" {
  description = "AMI ID for the instance"
  type        = string
  default     = "ami-07eef52105e8a2059"
}

variable "instance_type" {
  description = "The type of instance to use"
  type        = string
  default     = "t2.micro"
}
