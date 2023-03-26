variable "bucket_name" {
  default     = "max-bucket-for-testing"
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_s3_bucket" "artifacts" {
  bucket = var.bucket_name
}

resource "null_resource" "upload-url" {
  triggers = {
    build_number = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "printf '%s' $(aws s3 presign s3://${aws_s3_object.artifacts.bucket}/${aws_s3_object.file.key}) > upload-url"
  }
}


resource "null_resource" "download-url" {
  triggers = {
    build_number = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "printf '%s' $(aws s3 presign s3://${aws_s3_object.artifacts.bucket}/${aws_s3_object.file.key}) > download-url"
  }
}

data "local_file" "upload-url" {
  depends_on = [
    null_resource.url
  ]
  filename = "${path.module}/upload-url"
}

data "local_file" "download-url" {
  depends_on = [
    null_resource.url
  ]
  filename = "${path.module}/download-url"
}

output  "upload-url" {
  value = data.local_file.upload-url.content
}

output  "download-url" {
  value = data.local_file.download-url.content
}
