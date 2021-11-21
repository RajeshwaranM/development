resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.dev-subnet.id
  private_ips = ["10.0.1.5"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "foo" {
  ami           = "ami-0142f6ace1c558c7d" # us-west-2
  instance_type = "t2.micro"
  key_name      = "awsdevop"

  tags = {
    Name = "web server"
  }
  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }

}