resource "aws_instance" "roboshop-condition" {
  ami           = "ami-0055977a6e828a4f4"
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.medium"
  vpc_security_group_ids = [aws_security_group.condition.id]
    
    tags = { Name = "condition" }
  
}

resource "aws_security_group" "condition" {
  name        = "condition"
  description = "Allow TLS inbound traffic and all outbound traffic"

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

    }

    ingress {

    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

    }


  tags = {
    Name = "condition"
  }
}