resource "aws_s3_bucket" "common_bucket" {
  bucket = "common-resource-bucket"
}

resource "aws_s3_object" "tf_state" {
  bucket = aws_s3_bucket.common_bucket.bucket
  key    = "tf_state"
}