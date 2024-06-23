variable "website_dist_root" {
  type        = string
  description = "Directory containing website static resources"
}

variable "aws_route53_parent_domain_name" {
  type        = string
  description = "Apex domain for the website"
}

variable "aws_route53_webapp_subdomain_prefix" {
  type        = string
  description = "Hostname subdomain prefix (prepended to parent domain name)"
}

variable "aws_s3_website_bucket_name" {
  description = "S3 bucket for static website"
  type        = string
}

variable "aws_s3_website_cors_allowed_origins" {
  description = "List of allowed origins for S3 website (GET|POST http methods)"
  type        = list(string)
}

variable "aws_cloudfront_distribution_default_root_object" {
  description = "Default root object for s3 website (index.html)"
  type        = string
}

variable "aws_cloudfront_origin_id" {
  description = "Unique identifier for the CloudFront origin"
  type        = string
}

variable "aws_cloudfront_s3_logs_bucket" {
  description = "S3 bucket for server access logs"
  type        = string
}

variable "aws_cloudfront_s3_logs_prefix" {
  description = "S3 bucket for server access logs"
  type        = string
}

variable "aws_cloudfront_origin_access_control_name" {
  description = "Name of Cloudfront OAC (Origin Access Control) settings record"
  type        = string
}
