variable "project_name" {
  type        = string
  description = "Project name used for S3 bucket naming."
}

variable "environment" {
  type        = string
  description = "Deployment environment identifier."
}

variable "bucket_name_prefix" {
  type        = string
  description = "Prefix used to construct the S3 bucket name."
}

variable "enable_kms" {
  type        = bool
  description = "Enable KMS encryption for S3 bucket objects."
}

variable "tags" {
  type        = map(string)
  description = "Standardized tags for storage resources."
}
