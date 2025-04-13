terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.82.2"
    }
  }
  /*
  remote state = s3 bucket
  When working in colloborative environment if you dont maintain state in remote location, there will be chances of duplicates and errors. To avoid this store is remote location wich is Amazon S3.

  Locking can be enabled via S3 or DynamoDB. However, DynamoDB-based locking is deprecated and will be removed in a future minor version. To support migration from older versions of Terraform that only support DynamoDB-based locking, the S3 and DynamoDB arguments can be configured simultaneously.
  
  locking = Dynamo db
  */
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