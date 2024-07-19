module "user" {
  source = "./IAM"
  
}

module "server" {
  source = "./EC2"
  
}

module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.1"
}






