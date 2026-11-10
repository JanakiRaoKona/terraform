resource "aws_instance" "roboshop" {
  for_each      = var.instances
  ami           = var.ami
  instance_type = each.value.instance_type
  vpc_security_group_ids = [
    aws_security_group.comman.id,
    aws_security_group.roboshop[each.key].id
  ]
  tags = {
    Name = "${var.project}-${var.environment}-${each.key}"
  }

}

resource "aws_security_group" "comman" {
  name        = "${var.project}-${var.environment}-comman"
  description = "Allow TLS inbound traffic and all outbound traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "${var.project}-${var.environment}-comman"
  }
}
resource "aws_security_group" "roboshop" {
  for_each    = var.instances # terraform will give special variable is "each"
  name        = "${var.project}-${var.environment}-${each.key}"
  description = "Component SG for the instance of roboshop"

  ingress {
    from_port   = each.value.port_no
    to_port     = each.value.port_no
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "${var.project}-${var.environment}-${each.key}"
  }
}
