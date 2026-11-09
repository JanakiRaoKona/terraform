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

variable "instances" {
  type    = list(any)
  default = ["mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend"]

}

variable "zone_id" {
    type = string
    default = "Z03779601M3DCD1PTYF54"
}

variable "domain_name" {
    type  = string
    default = "janakiraodevops.online"
}
