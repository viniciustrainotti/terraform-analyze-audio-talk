data "archive_file" "this" {
  type        = "zip"
  source_file = "${local.lambdas_path}/lambda_function.py"
  output_path = "files/${var.name}.zip"
}

resource "aws_lambda_function" "this" {
  function_name = var.name
  handler       = var.handler # "index.handler"
  role          = aws_iam_role.lambda.arn
  runtime       = "python3.11"

  filename         = data.archive_file.this.output_path
  source_code_hash = data.archive_file.this.output_base64sha256

  timeout     = 30
  memory_size = 128

#  environment {
#    variables = {
#      TABLE = aws_dynamodb_table.this.name
#    }
#  }
}

resource "aws_lambda_permission" "sns" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = var.sns_arn
}