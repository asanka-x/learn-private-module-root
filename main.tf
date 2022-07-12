terraform {
  cloud {
    organization = "Moosarc"
    workspaces {
      name = "learn_private_module_root"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "s3-static-cdn" {
  source  = "app.terraform.io/Moosarc/s3-static-cdn/aws"
  name    = var.name
  region  = var.region
  prefix  = var.prefix
  version = "0.9.0"
}