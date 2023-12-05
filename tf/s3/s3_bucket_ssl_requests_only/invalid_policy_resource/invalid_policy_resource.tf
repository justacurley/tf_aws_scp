resource "aws_s3_bucket_policy" "bucket" {
    bucket = aws_s3_bucket.bucket.id
    policy = jsonencode({
        Version = "2012-10-17"
        Id      = "BUCKET-POLICY"
        Statement = [
            {
                Sid       = "EnforceTls"
                Effect    = "Deny"
                Principal = "*"
                Action    = "s3:*"
                Resource = [
                    # Valid if aws_S3_bucket_policy exists and references aws_s3_bucket arn
                    "${aws_s3_bucket.bucket.arn}/*",
                    "${aws_s3_bucket.bucket.arn}",
                ]
                Condition = {
                    Bool = {
                        "aws:SecureTransport" = "false"
                    }
                }
            },
            {
                Sid       = "EnforceProtoVer"
                Effect    = "Deny"
                Principal = "*"
                Action    = "s3:*"
                Resource = [
                    "${aws_s3_bucket.bucket.arn}/*",
                    "${aws_s3_bucket.bucket.arn}",
                ]
                Condition = {
                    NumericLessThan = {
                        "s3:TlsVersion": 1.2
                    }
                }
            }
        ]
    })
}
resource "aws_s3_bucket" "noencrypt" {
    bucket = "my-tls-unenforced-bucket"
}
resource "aws_s3_bucket" "bucket" {
    bucket = "my-tls-enforced-bucket"
}
