data "aws_route53_zone" "parent_domain" {
  name         = var.aws_route53_parent_domain_name
  private_zone = false
}

// ACM - DNS validation
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation

resource "aws_route53_record" "route53_acm_dns_validation_record" {
  for_each = {
    for dvo in aws_acm_certificate.api_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.parent_domain.zone_id
}

// API gateway Route53 record
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_domain_name

resource "aws_route53_record" "route53_api_gateway_record" {
  name    = aws_apigatewayv2_domain_name.api_domain_name.domain_name
  type    = "A"
  zone_id = data.aws_route53_zone.parent_domain.zone_id

  alias {
    name                   = aws_apigatewayv2_domain_name.api_domain_name.domain_name_configuration[0].target_domain_name
    zone_id                = aws_apigatewayv2_domain_name.api_domain_name.domain_name_configuration[0].hosted_zone_id
    evaluate_target_health = false
  }
}
