terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.55.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "new"
  region = "eu-west-1"
}

resource "aws_iam_user" "test" {
  name = "Kofi"


}



data "aws_iam_policy_document" "code" {
  statement {
    sid = "NanaPolicy"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }


}

resource "aws_iam_policy" "policy1" {
  name   = "NanaPolicy"
  path   = "/"
  policy = data.aws_iam_policy_document.code.json
}


resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.test.name
  policy_arn = aws_iam_policy.policy1.arn
}


resource "aws_iam_user_policy_attachment" "test-attach2" {
  user       = aws_iam_user.test.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_instance" "web" {
  ami           = "ami-06c68f701d8090592"
  instance_type = "t2.micro"

  tags = {
    Name = "Myinstance1"
  }
}

resource "aws_instance" "webweb" {
  ami           = "ami-08ca6be1dc85b0e84"
  provider = aws.new
  instance_type = "t2.micro"

  tags = {
    Name = "Myinstance2"
  }
}

output "ec2id" {
  value = aws_instance.web.private_ip
}

output "userid" {
  value = aws_iam_user.test.arn
}



