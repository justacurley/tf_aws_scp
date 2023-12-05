resource "aws_s3_bucket_lifecycle_configuration" "example" {
#   Valid if aws_S3_bucket_lifecycle_configuration exists AND status eq "Enabled" AND is associated with aws_s3_bucket
  bucket = aws_s3_bucket.bucket.id

  rule {
    id = "rule-1"

    # ... other transition/expiration actions ...

    status = "Enabled"
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "my-tf-test-bucket"
}
resource "aws_s3_bucket" "nolifecycle" {
  bucket = "my-tf-test-bucket-nolifecycle"
}