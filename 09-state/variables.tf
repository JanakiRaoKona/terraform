variable "instance_type" {
  type        = string
  default     = "t3.small"
  description = "EC2 instance type for the web server"

  # return true instance_type if the one of the item below are listed.
  validation {
    condition     = contains(["t3.micro", "t3.large", "t3.small", "t3.medium"], var.instance_type)
    error_message = "The instance type variable must be one of: t3.micro, t3.large, t3.small, t3.medium."
  }
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
