variable "storage_name" {}
variable "storage_location" {}

resource "google_storage_bucket" "test-image-store" {
  name     = "${var.storage_name}"
  location = "${var.storage_location}"
}
