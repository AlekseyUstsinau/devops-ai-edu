resource "aws_s3_bucket" "this" {
  bucket = "${var.bucket_name_prefix}-${var.environment}-app-artifacts"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = var.enable_kms ? "aws:kms" : "AES256"
        kms_master_key_id = var.enable_kms ? aws_kms_key.this[0].arn : null
      }
    }
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-app-bucket"
  })
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = "private"
}

resource "aws_kms_key" "this" {
  count = var.enable_kms ? 1 : 0

  description             = "KMS key for S3 artifact bucket ${var.project_name}-${var.environment}."
  deletion_window_in_days = 30

  tags = merge(var.tags, {
    Name = "${var.project_name}-${var.environment}-s3-kms-key"
  })
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "force_tls" {
  bucket = aws_s3_bucket.this.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "EnforceTLS"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.this.arn,
          "${aws_s3_bucket.this.arn}/*"
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    id     = "expire-old-objects"
    status = "Enabled"

    expiration {
      days = 90
    }

    noncurrent_version_expiration {
      noncurrent_days = 30
    }
  }
}
