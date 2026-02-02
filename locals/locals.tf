locals {
  ami_id  = "ami-0220d79f3f480ecf5"
  sg_id = "sg-0c5f6fbf77d34fcf3" # replace with my secirity_group
  instance_type  = var.instance_name == "db" ? "t3.small": "t3.micro"
  
  tags  = {
    Name: "locals"
  }
}