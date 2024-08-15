resource "aws_vpc" "main_vpc" {
  cidr_block           = var.main_vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "vpc - ${var.environment}"
  }
}