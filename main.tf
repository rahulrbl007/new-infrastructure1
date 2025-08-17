terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}


resource "aws_instance" "new_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = "NewInstance"
  } 
}

resource "aws_eip" "new-aws_eip" {
    instance = aws_instance.new_instance.id
    vpc      = true

    tags = {
        Name = "NewEIP"
    }
}

resource "aws_eip_association" "eip_assoc" {
    instance_id = aws_instance.new_instance.id
    allocation_id = aws_eip.new-aws_eip.id
}

resource "aws_s3_bucket" "new_s3_bucket" {
  bucket = var.NewS3Bucket
  acl    = "private"

  tags = {
    Name        = "NewS3Bucket"
    Environment = "Dev"
  }
}