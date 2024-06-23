variable "aws_lambda_source_code_path" {
  type        = string
  description = "FS path to Lambda function source code - relative to project root"
}

variable "aws_lambda_source_code_zip_file" {
  type        = string
  description = "FS path of zipped Lambda function code"
}

variable "aws_lambda_function_name" {
  type        = string
  description = "Name of the lambda function"
}

variable "aws_lambda_function_handler" {
  type        = string
  description = "Lambda function handler ('index.handler' for example)"
}

variable "aws_lambda_function_layer_arns" {
  type        = list(string)
  description = "ARNs of attached lambda layers"
}

variable "aws_lambda_runtime" {
  type        = string
  description = "Lambda runtime ('nodejs20.x' for example)"
}

variable "aws_lambda_timeout_seconds" {
  type        = number
  description = "Lambda function timeout in seconds"
}

variable "aws_iam_execution_role_name" {
  type        = string
  description = "Name of the IAM execution role"
}


variable "aws_lambda_env_variables_from_ssm_parameter_store" {
  type        = map(string)
  description = "Map with keys representing env variables and values, their path in SSM Parameter store"
}
