resource "aws_lb" "capstone_alb" {
  name               = var.project
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = [var.subnet_a_id, var.subnet_b_id]

  tags = {
    Name = "${var.project}-alb"
  }

}

resource "aws_lb_target_group" "target_elb" {
  name     = "${var.project}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "instance"

  health_check {
    path     = "/"
    port     = 80
    protocol = "HTTP"
    matcher  = "200"
    interval = 30
    timeout  = 5
  }
}

resource "aws_lb_listener" "listener_elb" {
  load_balancer_arn = aws_lb.capstone_alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_elb.arn
  }
}

