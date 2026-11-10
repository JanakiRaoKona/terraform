variable "environment" {
  type    = string
  default = "dev"
}

variable "project" {
  type    = string
  default = "roboshop"
}

variable "ami" {
  type        = string
  default     = "ami-0055977a6e828a4f4"
  description = "ami for the web server"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 instance type for the web server"

  # return true instance_type if the one of the item below are listed.
  validation {
    condition     = contains(["t3.micro", "t3.large", "t3.small", "t3.medium"], var.instance_type)
    error_message = "The instance type variable must be one of: t3.micro, t3.large, t3.small, t3.medium."
  }
}

# variable "instances" {
#   type    = list(any)
#   default = ["mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend"]

# }

variable "instances" {
  type = map(any)
  default = {
    mongodb = {
      instance_type = "t3.micro"
      port_no       = 27017
    },
    redis = {
      instance_type = "t3.micro"
      port_no       = 6379
    },
    mysql = {
      instance_type = "t3.small"
      port_no       = 3306
    },
    rabbitmq = {
      instance_type = "t3.micro"
      port_no       = 5672
    },
    catalogue = {
      instance_type = "t3.micro"
      port_no       = 8080
    },
    user = {
      instance_type = "t3.micro"
      port_no       = 8080
    },
    cart = {
      instance_type = "t3.micro"
      port_no       = 8080
    },
    shipping = {
      instance_type = "t3.micro"
      port_no       = 8080
    },
    payment = {
      instance_type = "t3.micro"
      port_no       = 8080
    },
    frontend = {
      instance_type = "t3.micro"
      port_no       = 80
    }
  }

}

variable "zone_id" {
  type    = string
  default = "Z03779601M3DCD1PTYF54"
}

variable "domain_name" {
  type    = string
  default = "janakiraodevops.online"
}
