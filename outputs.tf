
# output "website_url" {
#   description = "URL of the website"
#   value       = "https://${var.domain_name}"
# }

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID"
  value       = module.cloudfront.distribution_id
}

output "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  value       = module.cloudfront.distribution_domain_name
}

output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = module.s3.bucket_name
}

# output "certificate_arn" {
#   description = "ACM certificate ARN"
#   value       = module.acm.certificate_arn
# }

# output "nameservers" {
#   description = "Route53 name servers (if DNS zone was created)"
#   value       = var.create_dns_zone ? module.route53[0].name_servers : null
# }
