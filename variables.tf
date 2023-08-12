### Common
variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "dev"
}

### S3 audio server raw audios
variable "bucket_name_audio_server" {
  description = "Bucket Name Audio Server"
  type        = string
  default     = "audio-server"
}

variable "tags" {
  description = "Tags"
  type        = map
  default     = {}
}

### SNS audio arrived
variable "sns_audio_arrived" {
  description = "SNS Audio Arrived"
  type        = string
  default     = "audio-arrived"
}

variable "tags_audio_arrived" {
  description = "Tags"
  type        = map
  default     = {}
}

## Lambda transcribe conversation
variable "lambda_transcribe_conversation_name" {
  description = "Lambda Transcribe Conversation Name"
  type        = string
  default     = "transcribe-conversation"
}