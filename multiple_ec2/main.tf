provider "aws" {
    region = "us-east-1"
}

module "web_server" {
    source = "./modules/modules_ec2"
    instance_type = "t2.micro"
    ami = "ami-0866a3c8686eaeeba"
    instance_count = 3
    tags = {
      Role="web-server"
    } 
}

module "db_server" {
    source = "./modules/modules_ec2"
    instance_type = "t2.micro"
    ami = "ami-0fff1b9a61dec8a5f"
    instance_count = 1
    tags = {
      Role = "db_server"
    }
  
}