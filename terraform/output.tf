output "ec2_id" {
  value = aws_instance.app.id
}

output "s3_bucket_name" {
  value = aws_s3_bucket.bucket.bucket
}

