terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.99.1"
    }
  }
}
resource "aws_s3_bucket" "common_bucket" {
  bucket = "common-resource-bucket"
  object_lock_enabled = true
}

resource "aws_s3_object" "tf_state" {
  bucket = aws_s3_bucket.common_bucket.bucket
  key    = "tf_state"

}

resource "aws_s3_bucket_versioning" "common_versioning" {
  bucket = aws_s3_bucket.common_bucket.bucket
  versioning_configuration {
    status = "Enabled"
  }
}
