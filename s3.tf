resource "aws_s3_bucket" "bucket-cerberos" {
    bucket = "aws-cerberos-${local.sufix-s3}"
  
}