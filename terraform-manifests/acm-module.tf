module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "5.1.1"
  domain_name = trimsuffix(data.aws_route53_zone.mydomain.name, "." )
  zone_id = data.aws_route53_zone.mydomain.zone_id
  subject_alternative_names = [
    var.dns_name
  ]
  tags = local.common_tags
}
output "this_acm_certificate_arn" {
  value = module.acm.acm_certificate_arn
}