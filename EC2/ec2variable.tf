

variable "ami_web" {
    default =  "ami-06c68f701d8090592"
    type = string
    description = "Amazon Linux 2023 64 bit"
}

variable "instance_type_web" {
    default = "t2.micro"
    type = string
    
  
}
variable "ami_webweb" {
    default =  "ami-08ca6be1dc85b0e84"
    type = string
    description = "Amazon Linux 2023 64 bit"
}

variable "instance_type_webweb" {
    default = "t2.micro"
    type = string
    
}

variable "tagName1" {
    default = "Myinstance1"
    type = string
  
}

variable "tagName2" {
    default = "Myinstance2"
    type = string
  
}








