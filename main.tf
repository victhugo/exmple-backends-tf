provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "vhugo-sg" {
  name = "vhugo-sg"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

terraform {
  backend "s3" {
    bucket         = "my-backend-vhugo"
    key            = "envs/dev/terraform.tfstate"
    dynamodb_table = "state-lock"
    region         = "us-west-2"
  }
}

