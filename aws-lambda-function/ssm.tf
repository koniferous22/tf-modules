data "aws_ssm_parameter" "ssm_parameter_env_variables" {
  for_each = var.aws_lambda_env_variables_from_ssm_parameter_store
  name     = each.value
}