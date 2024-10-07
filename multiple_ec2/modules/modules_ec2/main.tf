provider "aws" {
    region = "us-east-1"
}

variable "ami" {
  type = string
}
variable "instance_type" {
  type = string
}

variable "instance_count" {
    type = number
    default = 1 
}
variable "tags" {
    type = map(string)
    default = {}
}

resource "aws_instance" "module_ec2" {
    ami = var.ami
    instance_type = var.instance_type
    count = var.instance_count
    tags = merge({
    Name = "EC2-${count.index + 1}"  
    },var.tags)
}

