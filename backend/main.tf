provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "terraform-state-storage-s3" {
    bucket = var.s3_bucket_name
    versioning {
      enabled = true
    }
    lifecycle {
      prevent_destroy = false
    }
    tags={
      Name = "S3 Remote Terraform State Store"
    }
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = var.dynamodb_table_name
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
  tags={
    Name = "DynamoDB Terraform State Lock Table"
  }
}
