resource "aws_instance" "db" {
  ami                    = "ami-0220d79f3f480ecf5"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0c5f6fbf77d34fcf3"]

  tags = {
    Name = "db"
  }

}
