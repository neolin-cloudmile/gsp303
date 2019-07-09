variable "storage_name" {}
variable "storage_location" {}

resource "google_storage_bucket" "storage_bucket" {
  name     = "${var.storage_name}"
  location = "${var.storage_location}"
}
