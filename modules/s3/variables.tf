variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "enable_public_access" {
  description = "Whether to allow public read access to the bucket"
  type        = bool
  default     = false
}