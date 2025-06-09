
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Provider principal
provider "aws" {
  region = var.aws_region
}

# Provider para ACM (debe ser us-east-1 para CloudFront)
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

# Datos locales
locals {
  project_name = var.project_name
  environment  = var.environment
  
  common_tags = {
    Project     = local.project_name
    Environment = local.environment
    ManagedBy   = "Terraform"
  }
}

# Módulo S3
module "s3" {
  source = "./modules/s3"
  
  bucket_name = "${local.project_name}-${local.environment}"
  tags        = local.common_tags
}

# Módulo ACM (certificado SSL)
/* module "acm" {
  source = "./modules/acm"
  
  domain_name         = var.domain_name
  alternative_domains = var.alternative_domains
  tags               = local.common_tags
  
  providers = {
    aws = aws.us_east_1
  }
}

# Módulo Route53 (opcional)
module "route53" {
  count  = var.create_dns_zone ? 1 : 0
  source = "./modules/route53"
  
  domain_name = var.domain_name
  tags        = local.common_tags
}
 */

# Módulo CloudFront
module "cloudfront" {
  source = "./modules/cloudfront"
  
  bucket_name             = module.s3.bucket_name
  bucket_domain_name      = module.s3.bucket_domain_name
  bucket_regional_domain  = module.s3.bucket_regional_domain_name
  /* certificate_arn         = module.acm.certificate_arn */
  /* domain_name            = var.domain_name */
  alternative_domains    = var.alternative_domains
  price_class           = var.cloudfront_price_class
  tags                  = local.common_tags
  
  /* depends_on = [module.acm] */
}

# Crear registro DNS A para apuntar a CloudFront
/* resource "aws_route53_record" "main" {
  count   = var.create_dns_zone ? 1 : 0
  zone_id = module.route53[0].zone_id
  name    = var.domain_name
  type    = "A"
  
  alias {
    name                   = module.cloudfront.distribution_domain_name
    zone_id               = module.cloudfront.distribution_hosted_zone_id
    evaluate_target_health = false
  }
} */

# Registro AAAA para IPv6
/* resource "aws_route53_record" "ipv6" {
  count   = var.create_dns_zone ? 1 : 0
  zone_id = module.route53[0].zone_id
  name    = var.domain_name
  type    = "AAAA"
  
  alias {
    name                   = module.cloudfront.distribution_domain_name
    zone_id               = module.cloudfront.distribution_hosted_zone_id
    evaluate_target_health = false
  }
} */