resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"
#   Valid if lifecycle_rule exists AND enabled eq true
  lifecycle_rule {
     id = "log"

    expiration {
      days = 90
    }

    enabled = true

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }
  }
}