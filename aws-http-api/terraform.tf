terraform {
  required_version = "~> 1.12"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

locals {
  api_full_domain = "${var.aws_route53_api_subdomain_prefix}.${var.aws_route53_parent_domain_name}"
}
