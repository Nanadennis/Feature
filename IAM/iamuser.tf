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