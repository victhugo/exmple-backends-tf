variable "s3_bucket_name" {
  type = string
  default = "my-backend-vhugo"
}

variable "dynamodb_table_name" {
  type = string
  default = "state-lock"
}
