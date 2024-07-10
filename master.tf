terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.55.0"
    }
  }
  backend "s3" {
    bucket = "nanadevopsacademy-assignment"
    key    = "backend/dev/nana/terraformstate"
    region = "us-east-1"
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
  name = var.user_name


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
  name   = var.policy_name
  path   = "/"
  policy = data.aws_iam_policy_document.code.json
}

resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.test.name
  policy_arn = aws_iam_policy.policy1.arn
}


resource "aws_iam_user_policy_attachment" "test-attach2" {
  user       = aws_iam_user.test.name
  policy_arn = var.policy_arn
}

resource "aws_instance" "web" {
  ami           = var.ami_web
  instance_type = var.instance_type_web

  tags = {
    Name = var.tagName1
  }
}

resource "aws_instance" "webweb" {
  ami           = var.ami_webweb
  provider = aws.new
  instance_type = var.instance_type_webweb

  tags = {
    Name = var.tagName2
  }
}

output "ec2id" {
  value = aws_instance.web.private_ip
}

output "userid" {
  value = aws_iam_user.test.arn
}



