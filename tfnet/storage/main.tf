variable "storage_name" {}
variable "storage_location" {}
variable "object_name" {}
variable "object_source" {}
variable "object_contenttype" {}

resource "google_storage_bucket" "win-startup-script" {
  name     = "${var.storage_name}"
  location = "${var.storage_location}"
}
resource "google_storage_bucket_object" "powershell" {
  name         = "${var.object_name}"
  source       = "${var.object_source}"
  bucket       = "${var.storage_name}"
  content_type = "${var.object_contenttype}"
  depends_on   = [ google_storage_bucket.win-startup-script ]
}
resource "google_storage_object_acl" "powershell-acl" {
  bucket = "${google_storage_bucket.win-startup-script.name}"
  object = "${google_storage_bucket_object.powershell.output_name}"
  
  role_entity = [ "READER:allUsers" ]
}
