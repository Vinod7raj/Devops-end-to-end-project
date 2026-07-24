data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = { Name = "main" }
}


resource "aws_subnet" "prod_public" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags                    = { Name = "product_public-${count.index + 1}" }
}


resource "aws_subnet" "prod_priv" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags              = { Name = "product_pri-${count.index + 1}" }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "internetgateway" }
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags   = { Name = "polling-nat-eip" }
}

resource "aws_nat_gateway" "polling_nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.prod_public[0].id
  tags          = { Name = "gw NAT" }
}

resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.polling_nat.id
  }
}

resource "aws_route_table_association" "routeass" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.prod_public[count.index].id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "routeasspri" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = aws_subnet.prod_priv[count.index].id
  route_table_id = aws_route_table.private_route.id
}
