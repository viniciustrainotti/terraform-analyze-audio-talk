data "aws_caller_identity" "current" {}

### S3 audio server raw audios
module "raw_audios" {
  source = "./modules/s3"

  name = "${data.aws_caller_identity.current.id}-${var.bucket_name_audio_server}-${var.environment}"

  sns_arn = module.sns_audio_arrived.arn

  tags = {
    Environment = var.environment
  }
}
### SNS audio arrived
module "sns_audio_arrived" {
  source = "./modules/sns"

  name = "${var.sns_audio_arrived}-${var.environment}"

  bucket_arn = module.raw_audios.arn

  lambda_arn = module.lambda_transcribe_conversation.arn

  tags = {
    Environment = var.environment
  }
}

### Lambda transcribe conversation
module "lambda_transcribe_conversation" {
  source = "./modules/lambda"

  name = "${var.lambda_transcribe_conversation_name}-${var.environment}"
  handler = "lambda_function.lambda_handler"

  sns_arn = module.sns_audio_arrived.arn

  tags = {
    Environment = var.environment
  }
}