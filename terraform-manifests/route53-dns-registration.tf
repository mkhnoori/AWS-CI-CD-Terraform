variable "dns_name" {
  type = string
  default = "mkhnoori.net"
}
resource "aws_route53_record" "apps_dns" {
  name    = var.dns_name
  type    = "A"
  zone_id = data.aws_route53_zone.mydomain.zone_id
  alias {
    evaluate_target_health = true
    name                   = module.alb.dns_name
    zone_id                = module.alb.zone_id
  }
}