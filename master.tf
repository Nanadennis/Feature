module "user" {
  source = "./IAM"
  user_name = var.user_name
  policy_name = var.policy_name
  policy_arn = var.policy_arn
}

module "server" {
  source = "./EC2"
  ami_web = var.ami_web
  instance_type_web =var.instance_type_web 
  instance_type_webweb =var.instance_type_webweb
  ami_webweb =var.ami_webweb
  
}

module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.1"
}






