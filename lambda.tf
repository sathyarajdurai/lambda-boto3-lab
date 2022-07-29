data "archive_file" "python_zip" {
    type = "zip"
    source_file = "${path.module}/python-scripts/imagereko.py"
    output_path = "${path.module}/lambda-image-function.zip"
}

resource "aws_lambda_function" "lab_lambda_image_rekognition" {
  filename      = data.archive_file.python_zip.output_path
  function_name = imagereko

  role          = aws_iam_role.lambda_role.arn
  handler       = "imagereko.lambda_handler"

  source_code_hash = filebase64sha256(data.archive_file.python_zip.output_path)

  runtime = "python3.8"
  timeout = 10

  environment {
    variables = {
      "METADATA_TABLE" = aws_dynamodb_table.lambda_image_rekognition.name
    }
  }
}