resource "aws_eip" "bastion_eip" {
  depends_on = [module.ec2-instance, module.vpc]
  instance = module.ec2-instance.id[0]
  tags = local.common_tags
}