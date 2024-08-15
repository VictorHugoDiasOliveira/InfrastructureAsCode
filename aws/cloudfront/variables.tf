# Common variables used in every Terraform project
variable "aws_region" {
  description = "String: AWS Account Region."
  type        = string
}
variable "environment" {
  description = "String: AWS account environment name. e.g.: dev, test, or prod."
  type        = string
}
variable "project_name" {
  description = "String: The project name for the frontend."
  type        = string
}