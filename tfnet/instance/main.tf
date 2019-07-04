variable "instance_name" {}
variable "instance_zone" {}
variable "instance_type" {}
variable "instance_imagetype" {}
variable "instance_subnetwork" {}
variable "instance_subnetwork1" {}
variable "instance_ephemeralip" {}


resource "google_compute_instance" "vm_instance" {
  name         = "${var.instance_name}"
  zone         = "${var.instance_zone}"
  machine_type = "${var.instance_type}"
  boot_disk {
    initialize_params {
      image = "${var.instance_imagetype}"
    }
  }
  network_interface {
    subnetwork = "${var.instance_subnetwork}"
    "${var.instance_ephemeralip}"
  }
  network_interface {
    subnetwork = "${var.instance_subnetwork1}"
  }
}
