resource "aws_instance" "roboshop-mongodb" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.mongodb.id]
    
    tags = var.ec2_tags
  
}

resource "aws_security_group" "mongodb" {
  name        = "mongodb"
  description = "Allow TLS inbound traffic and all outbound traffic"

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

    }

    ingress {

    from_port        = var.from_port
    to_port          = var.from_port
    protocol         = "-1"
    cidr_blocks      = var.cidr

    }


  tags = {
    Name = var.ec2_tags.Name
  }
}