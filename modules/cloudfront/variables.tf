
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "bucket_domain_name" {
  description = "Domain name of the S3 bucket"
  type        = string
}

variable "bucket_regional_domain" {
  description = "Regional domain name of the S3 bucket"
  type        = string
}

/* variable "certificate_arn" {
  description = "ARN of the ACM certificate"
  type        = string
}
 */
/* variable "domain_name" {
  description = "Primary domain name"
  type        = string
} */

variable "alternative_domains" {
  description = "Alternative domain names"
  type        = list(string)
  default     = []
}

variable "price_class" {
  description = "CloudFront price class"
  type        = string
  default     = "PriceClass_100"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}