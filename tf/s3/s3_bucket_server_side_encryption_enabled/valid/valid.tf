resource "aws_s3_bucket" "mybucket" {
  bucket = "mybucket"
  server_side_encryption_configuration {
    rule {
        # Valid if apply_server_side_encryption_by_default is present. sse_algorithm is a required parameter and ensure encryption.
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.id
        sse_algorithm = "aws:kms"
      }
      bucket_key_enabled = false
    }
  }
}