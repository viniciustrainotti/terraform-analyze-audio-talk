data "aws_iam_policy_document" "topic" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }

    actions   = ["SNS:Publish"]
    resources = ["arn:aws:sns:*:*:${var.name}"]

    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = [var.bucket_arn]
    }
  }
}

resource "aws_sns_topic" "this" {
  name = var.name
  policy = data.aws_iam_policy_document.topic.json

  tags = var.tags
}

resource "aws_sns_topic_subscription" "lambda" {
  endpoint  = var.lambda_arn
  protocol  = "lambda"
  topic_arn = aws_sns_topic.this.arn
}