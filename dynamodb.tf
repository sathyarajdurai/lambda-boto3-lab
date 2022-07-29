resource "aws_dynamodb_table" "rekognition_lab" {
  name           = "lambda-image-data"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "rekog"

  attribute {
    name = "rekog"
    type = "S"
  }

  tags           = {
    Name = "rekog-data"
  }
}