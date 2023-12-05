resource "aws_s3_bucket_versioning" "versioning_example" {
# Valid if aws_S3_bucket_versioning exists AND status eq Enabled AND is associated with aws_s3_bucket
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "example-bucket"
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.example.id
  acl    = "private"
}
