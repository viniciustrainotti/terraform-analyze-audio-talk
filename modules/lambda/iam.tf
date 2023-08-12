data "aws_iam_policy_document" "this" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "lambda" {
#  statement {
#    sid       = "AllowDynamoPermissions"
#    effect    = "Allow"
#    resources = ["*"]
#
#    actions = ["dynamodb:*"]
#  }
#
#  statement {
#    sid       = "AllowInvokingLambdas"
#    effect    = "Allow"
#    resources = ["arn:aws:lambda:*:*:function:*"]
#    actions   = ["lambda:InvokeFunction"]
#  }

  statement {
    sid       = "AllowCreatingLogGroups"
    effect    = "Allow"
    resources = local.statement_allow_createing_log_groups
    actions   = ["logs:CreateLogGroup"]
  }

  statement {
    sid       = "AllowWritingLogs"
    effect    = "Allow"
    resources = local.statement_allow_writing_logs

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
  }
}

resource "aws_iam_role" "lambda" {
  name               = "${var.name}-role"
  assume_role_policy = data.aws_iam_policy_document.this.json
}

resource "aws_iam_policy" "this" {
  name   = "${var.name}-policy"
  policy = data.aws_iam_policy_document.lambda.json
}

resource "aws_iam_role_policy_attachment" "this" {
  policy_arn = aws_iam_policy.this.arn
  role       = aws_iam_role.lambda.name
}