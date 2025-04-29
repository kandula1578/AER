output "load_balancer_address" {
  value = aws_lb.capstone_alb.dns_name
}

output "load_balancer_id" {
  value = aws_lb.capstone_alb.id
}

output "capstone_target_arn" {
  value = aws_lb_target_group.target_elb.arn
}
