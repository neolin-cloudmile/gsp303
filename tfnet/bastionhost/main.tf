variable "instance_name" {}
variable "instance_zone" {}
variable "instance_type" {}
variable "instance_imagetype" {}
variable "instance_tags" {}
variable "instance_subnetwork" {}
variable "instance_subnetwork1" {}
variable "instance_startupscript" {}

resource "google_compute_instance" "vm_instance" {
  name         = "${var.instance_name}"
  zone         = "${var.instance_zone}"
  machine_type = "${var.instance_type}"
  tags         = ["${var.instance_tags}"]
  boot_disk {
    initialize_params {
      image = "${var.instance_imagetype}"
    }
  }
  network_interface {
    subnetwork = "${var.instance_subnetwork}"
    access_config {
    }
  }
  network_interface {
    subnetwork = "${var.instance_subnetwork1}"
  }
  metadata = {
    windows-startup-script-url = "${var.instance_startupscript}"
  }
}
