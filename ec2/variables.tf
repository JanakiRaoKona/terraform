variable "ami" {
  type        = string
  default     = "ami-0055977a6e828a4f4"
  description = "ami for the web server"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 instance type for the web server"
}

variable "cidr" {
  type        = list
  default     = ["0.0.0.0/0"]
  description = "cidr for the web server"
}

variable "from_port" {
  type        = number
  default     = 0
}

variable "ec2_tags" {
  type = map
  default = {
    Name        = "roboshop-mongodb"
    Environment = "dev"
    Terraform   = true
    Project     = "roboshop"
    Component = "mongodb"
  }
  description = "EC2 tags for roboshop"
}
