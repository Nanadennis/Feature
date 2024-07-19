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