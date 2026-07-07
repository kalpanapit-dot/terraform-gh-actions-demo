terraform {
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

variable "aws_region" {
  description = "AWS region to deploy in"
  type        = string
  default     = "ap-south-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket (must be globally unique)"
  type        = string
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = var.bucket_name

 tags = {
  Environment = "learning"
  ManagedBy   = "github-actions"
  Stage       = "debug-run-2"
}
}
output "bucket_arn" {
  value = aws_s3_bucket.demo_bucket.arn
}