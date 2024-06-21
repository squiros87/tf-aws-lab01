resource "aws_vpc" "main" {
  cidr_block = var.virginia_cidr
  tags = {
    Name = "VPC_VIRGINIA-${local.sufix}"
  }


}
resource "aws_subnet" "publicsubnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnets[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet-${local.sufix}"
  }

}


resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnets[1]
  tags = {
    Name = "private subnet-${local.sufix}"
  }
  depends_on = [aws_subnet.publicsubnet]

}

resource "aws_internet_gateway" "igw_vpc" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "IGW_TERRAFORM-${local.sufix}"
  }
}

resource "aws_security_group" "allow_ssh_public" {
  dynamic "ingress" {
    for_each = var.ports_sg
  content {
    from_port = ingress.value
    to_port = ingress.value
    protocol = "TCP"
  }
  }
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "allow_ssh_public-${local.sufix}"
  }

  
}


# resource "aws_security_group" "allow_ssh_public" {
#   name        = "allow_ssh_public"
#   description = "Allow ssh inbound traffic and all outbound traffic"
#   vpc_id      = aws_vpc.main.id

#   tags = {
#     Name = "allow_ssh_public-${local.sufix}"
#   }
# }

# resource "aws_vpc_security_group_ingress_rule" "ingress_ssh" {
#   security_group_id = aws_security_group.allow_ssh_public.id
#   cidr_ipv4   = var.cidr_security_group
#   from_port   = 22
#   to_port     = 22
#   ip_protocol = "tcp"
# }

resource "aws_vpc_security_group_egress_rule" "egress_all" {
  security_group_id = aws_security_group.allow_ssh_public.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_route_table" "igw_table_terraform" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_vpc.id
  }

  tags = {
    Name = "igw_default_route_terraform-${local.sufix}"
  }
}
resource "aws_route_table_association" "igw_default_route_asociation" {
  subnet_id      = aws_subnet.publicsubnet.id
  route_table_id = aws_route_table.igw_table_terraform.id
}