variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  default = "ami-020cba7c55df1f615"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "my_ip" {
  description = "Your public IP with /32"
  default     = "172.31.0.0/16"
}