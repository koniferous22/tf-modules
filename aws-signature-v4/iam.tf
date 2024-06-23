// This module takes takes care of creds required for signaturev4 request signing
// Example Use Case - IAM Authorization for Calendar Admin API gateway

resource "aws_iam_group" "signature4_authorized_group" {
  name = var.aws_iam_group_name
}

resource "aws_iam_group_policy" "my_developer_policy" {
  name  = var.aws_iam_group_policy_name
  group = aws_iam_group.signature4_authorized_group.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "execute-api:Invoke",
        ]
        Effect = "Allow"
        // Provides access to 'execute-api
        // * current aws region and account
        // * specified api id
        // * specified stage id
        // * all methods on all paths (asterisk)
        Resource = "arn:aws:execute-api:${data.aws_region.current_aws_region.name}:${data.aws_caller_identity.current_aws_account.account_id}:${var.aws_api_gateway_api_id}/${var.aws_api_gateway_api_stage}/*"
      },
    ]
  })
}

resource "aws_iam_user" "signature4_authorized_user" {
  name = var.aws_iam_user_name
}

resource "aws_iam_user_group_membership" "signature4_group_membership" {
  user = aws_iam_user.signature4_authorized_user.name

  groups = [
    aws_iam_group.signature4_authorized_group.name
  ]
}
