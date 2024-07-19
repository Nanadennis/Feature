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
