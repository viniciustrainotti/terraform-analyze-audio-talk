## Common
variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "Tags"
  type        = map
  default     = {}
}

### SNS
variable "name" {
  description = "SNS Name"
  type        = string
}


### S3
variable "bucket_arn" {
  description = "S3 Bucket ARN"
  type        = string
}

### Lambda
variable "lambda_arn" {
  description = "Lambda ARN"
  type        = string
}