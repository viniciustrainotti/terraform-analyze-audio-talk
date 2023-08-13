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

### Lambda
variable "name" {
  description = "Labmda Name"
  type        = string
}

variable "handler" {
  description = "Index handler for Lambda"
  type        = string
  default     = "index.handler"
}

### SNS
variable "sns_arn" {
  description = "SNS ARN"
  type        = string
}