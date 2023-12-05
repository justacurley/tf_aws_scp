resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
    # Valid if s3_bucket is associated with an aws_s3_bucket_server_side_encryption_configuration resource
  bucket = aws_s3_bucket.mybucket.id
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "mybucket"
}

# No s_s3_bucket_server_side_encryption_configuration association
resource "aws_s3_bucket" "noencrypt" {
  bucket = "mybucket"
}
