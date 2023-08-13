resource "aws_s3_bucket" "this" {
  bucket = var.name

  tags = var.tags
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.this.id

  topic {
    topic_arn     = var.sns_arn
    events        = ["s3:ObjectCreated:*"]
    filter_suffix = ".mp3"
  }
}