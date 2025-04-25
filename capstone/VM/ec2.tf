resource "aws_instance" "public1" {
  ami                         = "ami-0e449927258d45bc4"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.public1.id]
  associate_public_ip_address = "true"
  subnet_id                   = aws_subnet.public_1.id

  tags = {
    Name = "final-lab"
  }
}
