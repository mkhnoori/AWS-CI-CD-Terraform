output "lb_id" {
  value = module.alb.id
}
output "lb_arn" {
  value = module.alb.arn
}
output "lb_ds_name" {
  value = module.alb.dns_name
}
output "lb_arn_suffix" {
  value = module.alb.arn_suffix
}
output "lb_zone_id" {
  value = module.alb.zone_id
}
output "http_tcp_listener_arns" {
  value = module.alb.listeners.arn
}
output "http_tcp_listener_ids" {
  value = module.alb.listeners.id
}
output "target_group_arns" {
  value = module.alb.target_groups.arn
}
output "target_group_arns_suffixes" {
  value = module.alb.target_groups.arn_suffix
}
output "target_group_name" {
  value = module.alb.target_groups.name
}