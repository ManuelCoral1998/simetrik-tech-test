resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.public_subnets, count.index)
  map_public_ip_on_launch = true
  availability_zone       = element(var.azs, count.index)

  tags = {
    Name = "public-subnet${element(var.azs, count.index)}-${count.index}"
  }
}

resource "aws_subnet" "private" {
  count                   = length(var.private_subnets)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.private_subnets, count.index)
  map_public_ip_on_launch = false
  availability_zone       = element(var.azs, count.index)

  tags = {
    Name = "private-subnet-${element(var.azs, count.index)}-${count.index}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "ng" {
  subnet_id     = aws_subnet.public[0].id
  allocation_id = aws_eip.nat.id

  tags = {
    Name = "nat"
  }

  depends_on = [aws_internet_gateway.gw]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ng.id
  }

  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "public" {
  count          = length(var.public_subnets)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnets)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private.id
}
