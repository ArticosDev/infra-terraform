
output "distribution_id" {
  description = "CloudFront distribution ID"
  value       = aws_cloudfront_distribution.react_app.id
}

output "distribution_domain_name" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.react_app.domain_name
}

output "distribution_hosted_zone_id" {
  description = "CloudFront distribution hosted zone ID"
  value       = aws_cloudfront_distribution.react_app.hosted_zone_id
}