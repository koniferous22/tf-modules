variable "aws_api_gateway_api_id" {
  type        = string
  description = "Id from AWS API Gateway API"
}

variable "aws_api_gateway_api_stage" {
  type        = string
  description = "Stage from AWS API Gateway API"
}

variable "aws_iam_group_name" {
  type        = string
  description = "Name of the IAM Group authorized to use the API through execute-api policy"
}

variable "aws_iam_group_policy_name" {
  type        = string
  description = "Name of the execute-api policy attached to IAM Group"
}

variable "aws_iam_user_name" {
  type        = string
  description = "Name of the group member IAM user"
}
