terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

import {
  to = aws_cognito_user_pool.xpix
  id = "us-east-1_F6jLV06hD"
}

import {
  to = aws_cognito_user_pool_client.xpix
  id = "us-east-1_F6jLV06hD/5u5458415dhdfkmntkevul5rup"
}