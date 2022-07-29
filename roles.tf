resource "aws_iam_role" "lambda_role" {
  name = "labs-lambda-assume-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "labs-lambda -role"
  }
}

data "aws_iam_policy_document" "lambda_for_rekognition" {
  statement {
    sid = "LambdaForRekoginition"

    actions = [
      "Rekognition:*"
    ]

    resources = [
      "*"
    ]
  }
}

  data "aws_iam_policy_document" "lambda_for_s3_access" {
  statement {
    sid = "LambdaAccessS3Bucket"
    actions = [
      "s3:ListBucket",
      "s3:GetObject"
    ]
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.image_bucket.bucket}",
      "arn:aws:s3:::${aws_s3_bucket.image_bucket.bucket}/*"
    ]
  }
}


data "aws_iam_policy_document" "lambda_for_dynamodb" {
  statement {
    sid = "LambdaAccessdynamoDB"
    actions = [
      "dynamodb:PutItem"
    ]
    resources = [
      aws_dynamodb_table.rekognition_lab.arn
    ]
  }
}

