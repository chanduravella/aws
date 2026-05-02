
//Default provider
provider "aws" {
  region = "ap-south-1"
}

provider "aws" {
  alias = "global"
  region = "ap-south-1"
}