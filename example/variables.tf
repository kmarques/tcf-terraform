variable "aws_region" {}

variable "ssh_private_key" {
    sensitive = true
}
variable "ssh_public_key" {
    sensitive = true
}

variable "aws_instance_type"{
    default = "t2.micro"
}

variable "aws_instance_ami" {
    default = "ami-04e905a52ec8010b2"
    description = "Id for Debian ami"
}