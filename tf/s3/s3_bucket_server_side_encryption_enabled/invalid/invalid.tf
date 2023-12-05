resource "aws_s3_bucket" "mybucket" {
  bucket = "mybucket"
#   server_side_encryption_configuration {
#     rule {
#         # Valid if apply_server_side_encryption_by_default is present. sse_algorithm is a required parameter and ensure encryption.
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "aws:kms"
#       }
#       bucket_key_enabled = true
#     }
#   }
}