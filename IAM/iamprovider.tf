provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "new"
  region = "eu-west-1"
}