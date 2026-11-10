variable "ingress_rules" {
  default = {
    ssh = {
      port        = 22
      cidr_blocks = ["0.0.0.0/0"]
      description = "opening port number 22 from all IP for ssh access."
    },

    mysql = {
      port        = 3306
      cidr_blocks = ["0.0.0.0/0"]
      description = "opening port number 3306 from all IP for DB access."
    },

    backend = {
      port        = 8080
      cidr_blocks = ["0.0.0.0/0"]
      description = "opening port number 8080 from all IP for backend access."
    },

    http = {
      port        = 80
      cidr_blocks = ["0.0.0.0/0"]
      description = "opening port number 80 from all IP for frontend access."
    }

  }

}
