variable "instance_type" {
  type = string

}

variable "environment" {
  type = string

}

variable "cidr" {
  type        = list(any)
  default     = ["0.0.0.0/0"]
  description = "cidr for the web server"
}

variable "from_port" {
  type    = number
  default = 0
}

variable "ec2_tags" {
  type = map(any)
  default = {
    Name        = "roboshop-remote-state-demo-01"
    Environment = "dev"
    Terraform   = true
    Project     = "roboshop"
    Component   = "mongodb"
  }
  description = "EC2 tags for roboshop"
}
