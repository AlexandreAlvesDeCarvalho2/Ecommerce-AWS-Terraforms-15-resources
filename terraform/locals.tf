locals {
  lambdas_path = "${path.module}/../app/lambdas"

  common_tags = {
    Project   = "TODO Serverless App"
    CreatedAt = "2020-03-16"
    ManagedBy = "Terraform"
    Owner     = "Cleber Gasparoto"
    Service   = var.service_name
  }
}
