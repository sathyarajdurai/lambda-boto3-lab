resource "aws_s3_bucket" "image_bucket" {
    bucket = "lambda-ta-sathyaraj-image-bucket"

    tags = {
        Name = "image"
        Environment = "Lab"
    }

    lifecycle {
        prevent_destroy = true
    }
}

resource "aws_s3_bucket_notification" "bucket_event_notification" {
  bucket = aws_s3_bucket.image_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.lab_lambda_image_rekognition.arn
    events              = ["s3:ObjectCreated:*"]
  }
}