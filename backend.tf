 terraform {
   
 
 backend "s3" {
    bucket = "nanadevopsacademy-assignment"
    key    = "backend/dev/nana/terraformstate"
    region = "us-east-1"
  }
 }