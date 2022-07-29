data "archive_file" "python_zip" {
    type = "zip"
    source_file = "${path.module}/python-scripts/imagereko.py"
    output_path = "${path.module}/lambda-image-function.zip"
}
