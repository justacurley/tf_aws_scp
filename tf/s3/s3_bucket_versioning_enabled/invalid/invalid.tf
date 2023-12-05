resource "aws_s3_bucket" "bucket" {
    bucket = "versioning-enabled"
    # Valid if versioning configuration exists AND enabled eq true
    versioning {
      enabled = false
    }
}