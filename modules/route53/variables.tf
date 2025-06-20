variable "domain_name" {
  description = "Domain name for the hosted zone"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}