# VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.42.0.0/16"
  tags = {
    Name = "my_vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my_igw"
  }
}

# Internal Subnet
resource "aws_subnet" "internal" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.42.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "internal_subnet"
  }
}

# External Subnet
resource "aws_subnet" "external" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.42.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "external_subnet"
  }
}

resource "aws_route_table" "internal" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table_association" "internal" {
  subnet_id      = aws_subnet.internal.id
  route_table_id = aws_route_table.internal.id
}

resource "aws_route_table" "external" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

resource "aws_route_table_association" "external" {
  subnet_id      = aws_subnet.external.id
  route_table_id = aws_route_table.external.id
}