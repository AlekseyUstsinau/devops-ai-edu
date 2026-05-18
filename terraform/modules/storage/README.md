# Storage Module

This module provisions an encrypted, versioned S3 bucket for application artifacts.

## What it creates

- Encrypted S3 bucket with server-side encryption enabled
- Public access block settings to prevent accidental exposure
- Lifecycle rule to expire older object versions

## Inputs

- `project_name`: Project identifier for naming resources
- `environment`: Deployment environment name
- `bucket_name_prefix`: Prefix for the S3 bucket name
- `tags`: Standardized tags for the bucket

## Outputs

- `bucket_name`
- `bucket_arn`

## Design notes

The bucket is configured for production use with enforced encryption, blocked public access, versioning, and lifecycle cleanup. The name is environment-scoped to ensure isolation.
