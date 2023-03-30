resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
  location = "US"
  force_destroy = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  
  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }
}

resource "google_storage_bucket_access_control" "public_reader_rule" {
  bucket = google_storage_bucket.bucket.name
  role   = "READER"
  entity = "allUsers"
}

resource "google_storage_bucket_access_control" "public_writer_rule" {
  bucket = google_storage_bucket.bucket.name
  role   = "WRITER"
  entity = "allUsers"
}

# Make bucket public
#resource "google_storage_bucket_iam_member" "member" {
#  provider = google-beta
#  bucket   = google_storage_bucket.default.name
#  role     = "roles/storage.objectViewer"
#  member   = "allUsers"
#}
