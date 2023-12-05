Bucket policy that doesn't comply with s3-bucket-ssl-requests-only rule
This bucket policy doesn't comply with the s3-bucket-ssl-requests-only rule. Instead of an explicit deny statement, the policy allows access to requests that meet the condition "aws:SecureTransport": "true". This statement allows anonymous access to s3:GetObject for all objects in the bucket if the request uses HTTPS. Avoid this type of bucket policy unless your use case requires anonymous access through HTTPS:

{
  "Id": "ExamplePolicy",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "NOT-RECOMMENDED-FOR__AWSCONFIG-Rule_s3-bucket-ssl-requests-only",
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::DOC-EXAMPLE-BUCKET/*"
      ],
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "true"
        }
      },
      "Principal": "*"
    }
  ]
}