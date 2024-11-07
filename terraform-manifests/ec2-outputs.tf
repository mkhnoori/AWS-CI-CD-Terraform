output "ec2_bastion_public_instance_ids" {
  value = module.ec2-instance.id
}
output "ec2_bastion_public_ip" {
  value = module.ec2-instance.public_ip
}