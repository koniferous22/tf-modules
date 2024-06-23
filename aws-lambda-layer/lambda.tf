data "archive_file" "lambda_layer_source_directory" {
  type        = "zip"
  source_dir  = var.aws_lambda_layer_source_directory
  output_path = var.aws_lambda_layer_zip_file
}

resource "aws_lambda_layer_version" "lambda_layer" {
  filename   = data.archive_file.lambda_layer_source_directory.output_path
  layer_name = var.aws_lambda_layer_name

  compatible_runtimes = [var.aws_lambda_runtime]
}
