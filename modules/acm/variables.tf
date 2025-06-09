
variable "domain_name" {
  description = "Primary domain name for the certificate"
  type        = string
}

variable "alternative_domains" {
  description = "Alternative domain names for the certificate"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}