resource "aws_security_group" "global-sg-2021" {
  name        = var.sgname
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.dev-vpc.id

  ingress {
    description = "Allow inbound rule for ssh http https"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cidr

  }

  ingress {
    description = "Allow inbound rule for https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.cidr

  }

  ingress {
    description = "Allow inbound rule for http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.cidr

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr

  }

  tags = {
    Name = var.sgname
  }
}