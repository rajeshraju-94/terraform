terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.82.2"
    }
  }
  backend "s3" {
    bucket = "devops-81s-remotestate"
    key    = "remote-state-demo"
    region = "ap-south-1"
    dynamodb_table = "devops-81s-locking"
  }
}

provider "aws" {
  region = "ap-south-1"
}