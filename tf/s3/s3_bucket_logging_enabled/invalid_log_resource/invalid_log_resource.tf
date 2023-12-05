resource "aws_s3_bucket" "example" {
  bucket = "my-tf-example-bucket"

  lifecycle {
    ignore_changes = [
      grant,
      logging
    ]
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.example.id
  acl    = "private"
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = "my-tf-log-bucket"

  lifecycle {
    ignore_changes = [
      grant
    ]
  }
}

resource "aws_s3_bucket_acl" "log_bucket_acl" {
  bucket = aws_s3_bucket.log_bucket.id
  acl    = "log-delivery-write"
}

#resource "aws_s3_bucket_logging" "example" {
#  bucket = aws_s3_bucket.example.id
#
#  target_bucket = aws_s3_bucket.log_bucket.id
#  target_prefix = "log/"
#}
