terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "AKIA5DHMLTA4H2OD5XBH" 
  secret_key = "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"
}
