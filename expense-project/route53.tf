resource "aws_route53_record" "expense" {
  allow_overwrite = true
  count           = length(var.instance_names)
  zone_id         = var.zone_id
  name            = local.name
  type            = "A"
  ttl             = 1
  records         = [local.records]
}

