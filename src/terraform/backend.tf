terraform {
  backend "s3" {
    bucket = "common-resource-bucket"
    key = "tf_state"
    region = "ap-south-1"
  }

}