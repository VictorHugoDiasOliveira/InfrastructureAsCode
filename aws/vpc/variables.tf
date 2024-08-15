# Common variables used in every Terraform project
variable "aws_region" {
  description = "String: AWS Account Region."
  type        = string
}

variable "environment" {
  description = "String: AWS account environment name. e.g.: dev, test, or prod."
  type        = string
}

variable "main_vpc_cidr_block" {
  description = "String: The CIDR range used at the VPC level"
  type        = string
}

variable "aws_availability_zones" {
  description = "String: AWS Account Region."
  type        = list(string)
}