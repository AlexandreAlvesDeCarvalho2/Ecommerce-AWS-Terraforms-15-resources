variable "env" {
  type    = string
  default = "dev"
}

variable "aws_region" {
  type    = string
  default = "sa-east-1"
}

variable "aws_profile" {
  type    = string
  default = "AlexandreAWS"
}

variable "aws_account_id" {
  type    = string
  default = "365623645180"
}

variable "service_name" {
  type    = string
  default = "produtos"
}

variable "service_domain" {
  type        = string
  description = ""
  default     = "products"
}
