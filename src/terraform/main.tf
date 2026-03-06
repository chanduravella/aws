resource "aws_s3_bucket" "common_bucket" {
  bucket = "common_resource_bucket"
}

resource "aws_s3_object" "tf_state" {
  bucket = aws_s3_bucket.common_bucket.arn
  key    = "tf_state"
}