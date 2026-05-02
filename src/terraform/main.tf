module "ap-south-1" {
  source = "./cross-region"

  providers = {
    aws = aws
  }
}

