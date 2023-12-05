There is a logging {} config block for the aws_s3_resource that is being deprecated in 6.x

The new way to do it is with an aws_s3_bucket_logging resource, that takes bucket and target_bucket as params. 
