variable "storage_name" {}
variable "storage_location" {}
variable "object_name" {}
variable "object_source" {}
variable "object_bucket" {}
variable "object_conenttype" {}

resource "google_storage_bucket" "test-image-store" {
  name     = "${var.storage_name}"
  location = "${var.storage_location}"
}
resource "google_storage_bucket_object" "powershell" {
  name         = "${var.object_name}"
  source       = "${var.object_source}"
  bucket       = "${var.object_bucket}"
  content_type = "${var.object_contenttype}"
  depends_on   = [ google_storage_bucket.test-image-store ]
}
