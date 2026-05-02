module "global" {
  source = "./global"

    providers = {
        aws = aws
    }
}

module "ap-south-1" {
  source = "./cross-region"

  providers = {
    aws = aws
  }
}
