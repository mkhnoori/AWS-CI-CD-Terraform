variable "aws_region" {
  description = "the region where our resources to be created"
  type = string
  default = "us-east-1"
}
variable "environment" {
  description = "environment variable used as prefix"
  type = string
  default = "DEV"
}
variable "business_division" {
  description = "in large organizations this infrastructure is belong to"
  type = string
  default = "SAP"
}