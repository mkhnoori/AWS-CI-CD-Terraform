data "aws_route53_zone" "mydomain" {
  name = "mkhnoori.net"
}
output "mydomain_zone_id" {
  value = data.aws_route53_zone.mydomain.zone_id
}
output "mydomain_name" {
  value = data.aws_route53_zone.mydomain.name
}