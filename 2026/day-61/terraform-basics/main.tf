terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
}
resource "aws_s3_bucket" "my_bucket" {
  bucket = "omkarkhi-test-bucket"
}

resource "aws_instance" "my-ec2" {
  ami           = "ami-045443a70fafb8bbc"
  instance_type = "t3.micro"

  tags = {
    Name = "TerraWeek-Modified"
  }
}