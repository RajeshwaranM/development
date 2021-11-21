resource "aws_vpc" "dev-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "dev-vpc"
  }
}
#subnet:Attach to VPC
resource "aws_subnet" "dev-subnet" {
  vpc_id                  = aws_vpc.dev-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-2a"
  tags = {
    Name = "dev-subnet"
  }
}
# Internet Gateway: attach to VPC
resource "aws_internet_gateway" "dev-gw" {
  vpc_id = aws_vpc.dev-vpc.id

  tags = {
    Name = "dev-gw"
  }
}
# Route table: attach Internet Gateway
resource "aws_route_table" "dev-rt" {
  vpc_id = aws_vpc.dev-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-gw.id
  }

  tags = {
    Name = "dev-rt"
  }
}

# Route table association with dev subnets
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.dev-subnet.id
  route_table_id = aws_route_table.dev-rt.id
}
