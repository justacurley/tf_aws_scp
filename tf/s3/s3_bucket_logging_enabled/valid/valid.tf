resource "aws_s3_bucket" "log_bucket" {
  bucket = "my-tf-log-bucket"

  lifecycle {
    ignore_changes = [
      grant
    ]
  }
}
resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"
  #in configuration
  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
  }
}
