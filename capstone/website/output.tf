output "load_balancer_address" {
  value       = module.elb.load_balancer_address
  description = "The DNS name for the Load Balancer."
}
