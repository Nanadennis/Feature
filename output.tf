output "ec2id" {
  value = aws_instance.web.private_ip
}

output "userid" {
  value = aws_iam_user.test.arn
}
