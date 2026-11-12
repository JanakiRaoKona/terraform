resource "aws_instance" "provisioners" {
  ami                    = "ami-0055977a6e828a4f4"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.provisioners.id]

  tags = { Name = "roboshop-provisioners" }


  provisioner "local-exec" {
    command = "echo ${self.private_ip} > inventory.ini"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo Instance is going to destroyed..."
  }

  provisioner "local-exec" {
    command = "echo Instance is created..."
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo dnf install nginx -y",
  #     "sudo systemctl enable nginx",
  #     "sudo systemctl start nginx"
  #   ]
  # }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo systemctl stop nginx"
    ]
  }

  provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh"
    ]
  }

}

resource "aws_security_group" "provisioners" {
  name        = "provisioners"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }



  tags = {
    Name = "roboshop-provisioners"
  }
}
