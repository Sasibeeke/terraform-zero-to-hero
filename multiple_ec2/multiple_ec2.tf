provider "aws" {
  region = "us-east-1"
}

variable "instances" {
  type = map(object({
    instance_type = string
    ami           = string
  }))
  default = {
    instance1 = {
      instance_type = "t2.micro"
      ami           = "ami-0866a3c8686eaeeba"
    }
    instance2 = {
      instance_type = "t2.micro"
      ami           = "ami-005fc0f236362e99f"
    }
  }
}


resource "aws_instance" "sasiram" {
  for_each = var.instances
  ami           = each.value.ami
  instance_type = each.value.instance_type
  //count         = 4
  tags = {
    # The count.index allows you to launch a resource 
    # starting with the distinct index number 0 and corresponding to this instance.
    #Name = "my-machine-${count.index}"
    Name = each.key
  }

}

