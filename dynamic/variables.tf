variable "inbound_rules" {
  type = list(object({
    port         = number
    protocol     = string
    allowed_cidr = list(string)
  }))

  default = [
    {
      port         = 22
      protocol     = "tcp"
      allowed_cidr = ["0.0.0.0/0"]
    },
    {
      port         = 80
      protocol     = "tcp"
      allowed_cidr = ["0.0.0.0/0"]
    },
    {
      port         = 8080
      protocol     = "tcp"
      allowed_cidr = ["0.0.0.0/0"]
    },
    {
      port         = 3306
      protocol     = "tcp"
      allowed_cidr = ["0.0.0.0/0"]
    }

  ]

}
