variable "storage_name" {}
variable "storage_location" {}

resource "google_storage_bucket" "image-store" {
  name     = "image-store-bucket"
  location = "${var.storage_location}"
}
