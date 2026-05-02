
resource "aws_iam_role" "dev-role" {
  name = "dev-role"
  description = "IAM role for dev activities"
  assume_role_policy = data.aws_iam_policy_document.dev-role-trust-policy.json
}

// Trust policy for the dev-role - allows any user/principal in the account to assume this role
data "aws_iam_policy_document" "dev-role-trust-policy" {

  statement {
    sid = "Allow sts:AssumeRole from any principal in account"
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:*"]
    }
  }
}

data "aws_iam_policy_document" "dev-role-permission-policy-document" {
  statement {
    sid = "Allow access on all resources"
    effect = "Allow"
    actions = [
      "s3:*",
      "ec2:*",
      "iam:*",
      "vpc:*",
      "cloudwatch:*",
      "lambda:*",
      "cloudTrail:*",
    ]
    resources = ["*"]
  }

  statement {
    sid = "Explicitly deny access to delete resources"
    effect = "Deny"
    actions = [
      "s3:Delete*",
      "ec2:Terminate*",
      "iam:Delete*",
      "vpc:Delete*",
      "cloudwatch:Delete*",
      "lambda:Delete*",
      "cloudTrail:Delete*",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy_attachment" "dev-role-permission-policy-attachment" {
  role       = aws_iam_role.dev-role.name
  policy_arn = aws_iam_policy.dev-role-permission-policy.arn
}

resource "aws_iam_policy" "dev-role-permission-policy" {
  name       = "Dev Role Permission Policy Attachment"
  policy     = data.aws_iam_policy_document.dev-role-permission-policy-document.json
}
