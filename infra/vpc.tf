resource "aws_vpc" "xpix" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "csd126-xpix-vpc"
  }
}

resource "aws_subnet" "public_1a" {
  vpc_id                  = aws_vpc.xpix.id
  cidr_block              = "10.0.0.0/20"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "csd126-xpix-subnet-public1-us-east-1a"
  }
}

resource "aws_subnet" "public_1b" {
  vpc_id                  = aws_vpc.xpix.id
  cidr_block              = "10.0.16.0/20"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "csd126-xpix-subnet-public2-us-east-1b"
  }
}

resource "aws_subnet" "private_1a" {
  vpc_id            = aws_vpc.xpix.id
  cidr_block        = "10.0.128.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "csd126-xpix-subnet-private1-us-east-1a"
  }
}

resource "aws_subnet" "private_1b" {
  vpc_id            = aws_vpc.xpix.id
  cidr_block        = "10.0.144.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "csd126-xpix-subnet-private2-us-east-1b"
  }
}

resource "aws_internet_gateway" "xpix" {
  vpc_id = aws_vpc.xpix.id

  tags = {
    Name = "csd126-xpix-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.xpix.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.xpix.id
  }

  tags = {
    Name = "csd126-xpix-rtb-public"
  }
}

resource "aws_route_table" "private_1a" {
  vpc_id = aws_vpc.xpix.id

  tags = {
    Name = "csd126-xpix-rtb-private1-us-east-1a"
  }
}

resource "aws_route_table" "private_1b" {
  vpc_id = aws_vpc.xpix.id

  tags = {
    Name = "csd126-xpix-rtb-private2-us-east-1b"
  }
}

resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.public_1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_1b" {
  subnet_id      = aws_subnet.public_1b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_1a" {
  subnet_id      = aws_subnet.private_1a.id
  route_table_id = aws_route_table.private_1a.id
}

resource "aws_route_table_association" "private_1b" {
  subnet_id      = aws_subnet.private_1b.id
  route_table_id = aws_route_table.private_1b.id
}

resource "aws_security_group" "xpix_app_server" {
  name        = "xpix-app-server"
  description = "allow XPix app server connections"
  vpc_id      = aws_vpc.xpix.id
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.xpix_app_server.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

import {
  to = aws_vpc.xpix
  id = "vpc-0c7ef15ac70d6e0d5"
}

import {
  to = aws_subnet.public_1a
  id = "subnet-0f9eb6840bc681cee"
}

import {
  to = aws_subnet.public_1b
  id = "subnet-003202489fc8924a7"
}

import {
  to = aws_subnet.private_1a
  id = "subnet-044a0f6dbdda23f6d"
}

import {
  to = aws_subnet.private_1b
  id = "subnet-077ef7e1e41d293d2"
}

import {
  to = aws_internet_gateway.xpix
  id = "igw-0046adb3f41a5f5fc"
}

import {
  to = aws_route_table.public
  id = "rtb-0404d9961b3d3d71b"
}

import {
  to = aws_route_table.private_1a
  id = "rtb-01f7cca72c4f83967"
}

import {
  to = aws_route_table.private_1b
  id = "rtb-015550107d656600e"
}

import {
  to = aws_route_table_association.public_1a
  id = "subnet-0f9eb6840bc681cee/rtb-0404d9961b3d3d71b"
}

import {
  to = aws_route_table_association.public_1b
  id = "subnet-003202489fc8924a7/rtb-0404d9961b3d3d71b"
}

import {
  to = aws_route_table_association.private_1a
  id = "subnet-044a0f6dbdda23f6d/rtb-01f7cca72c4f83967"
}

import {
  to = aws_route_table_association.private_1b
  id = "subnet-077ef7e1e41d293d2/rtb-015550107d656600e"
}

import {
  to = aws_security_group.xpix_app_server
  id = "sg-0c835e082d9fa3384"
}

import {
  to = aws_vpc_security_group_ingress_rule.ssh
  id = "sgr-0b26889f69dc363fa"
}