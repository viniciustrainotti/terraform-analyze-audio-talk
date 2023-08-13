locals {
  lambdas_path = "${path.module}/src/lambda_transcribe_conversation"
  layers_path  = "${path.module}/../app/layers/nodejs"
  layer_name   = "joi.zip"

  statement_allow_writing_logs = ["arn:aws:logs:${var.aws_region}:${data.aws_caller_identity.current.id}:log-group:/aws/lambda/${var.name}:*"]
  statement_allow_createing_log_groups = ["arn:aws:logs:${var.aws_region}:${data.aws_caller_identity.current.id}:*"]

}