    




resource "aws_iam_user" "test" {
  name = var.user_name


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


provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "new"
  region = "eu-west-1"
}


