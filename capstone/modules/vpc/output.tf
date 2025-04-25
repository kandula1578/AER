output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_a_id" {
  value = aws_subnet.public_subnet_1.id
}

output "subnet_b_id" {
  value = aws_subnet.public_subnet_2.id
}
