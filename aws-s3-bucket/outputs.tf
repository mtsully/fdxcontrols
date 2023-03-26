output  "upload-url" {
  value = data.local_file.upload-url.content
}

output  "download-url" {
  value = data.local_file.download-url.content
}
