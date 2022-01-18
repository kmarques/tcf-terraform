variable "public_ssh_key" {
    sensitive = true
}
variable "private_ssh_key" {
    sensitive = true
}

variable "aws_key_pair_name" {
  default = "tcf-devops"
}

variable "aws_region" {
  default     = "eu-west-3"
}

variable "aws_instance_image" {
  default = "ami-04e905a52ec8010b2"
}

variable "aws_ec2_type" {
  default = "t2.micro"
}