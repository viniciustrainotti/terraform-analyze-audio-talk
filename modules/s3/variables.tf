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

### S3
variable "name" {
  description = "Bucket Name"
  type        = string
}


### SNS arn
variable "sns_arn" {

}