# Terraform AWS Application Load Balancer (ALB)
module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  #version = "5.16.0"
  version = "9.12.0"

  name = "${local.name}-alb"
  load_balancer_type = "application"
  vpc_id = module.vpc.vpc_id
  /*Option-1: Give as list with specific subnets or in next line, pass all public subnets
  subnets = [
    module.vpc.public_subnets[0],
    module.vpc.public_subnets[1]
  ]*/
  subnets = module.vpc.public_subnets
  #security_groups = [module.loadbalancer_sg.this_security_group_id]
  security_groups = [module.load_balancer_sg.security_group_id]
  # Listeners
  # HTTP Listener - HTTP to HTTPS Redirect
  listeners = {
    ex-http-https-redirect = {
      port     = 80
      protocol = "HTTP"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    },


    rules = [
      {
        priority = 1
        actions = [
          {
            type               = "forward"
            target_group_index = 0
          }
        ]

        conditions = [
          {
            path_patterns = ["/*"]

          }
        ]
      },
    ]
  }

  # Target Groups
  target_groups = [
    # App1 Target Group - TG Index = 0
    {
      name_prefix          = "app1-"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
    },
  ]
  tags = local.common_tags # ALB Tags
}