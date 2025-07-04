terraform {
  required_version = "~> 1.12"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

locals {
  website_full_domain = "${var.aws_route53_webapp_subdomain_prefix}.${var.aws_route53_parent_domain_name}"
}

// Custom provider instance required, as ACM Certificates for Cloudfront have to be located in us-east-1 region
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}
