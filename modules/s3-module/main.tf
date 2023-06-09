provider "aws" {
  region = "us-east-1"

}
resource "aws_s3_bucket" "my-bucket" {
  bucket = var.bucket_name
  tags = {
    Name = var.bucket_name
  }
}
resource "aws_s3_bucket_public_access_block" "public_bucket" {
  bucket                  = aws_s3_bucket.my-bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
