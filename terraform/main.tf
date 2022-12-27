terraform {
  required_version = "1.3.6"
}

provider "aws" {
  region                  = var.aws_region
  shared_credentials_files = ["/Users/alexa/Desktop/DevApps/AWS/Keys.txt"]
  profile                 = var.aws_profile

   
  default_tags {
    tags = {
      Project   = "Serverless REST API Tutorial"
      CreatedAt = "2021-09-05"
      ManagedBy = "Terraform"
      Owner     = "Cleber Gasparoto"
      Env       = var.env
    }
  
  }
}