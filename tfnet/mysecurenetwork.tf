# Create the securenetwork network
  resource "google_compute_network" "securenetwork" {
  name = "securenetwork"
  auto_create_subnetworks = "false"
}
# Create securesubnet-us subnetwork
resource "google_compute_subnetwork" "securesubnet-us" {
  name          = "securesubnet-us"
  region        = "us-central1"
  network       = "${google_compute_network.securenetwork.self_link}"
  ip_cidr_range = "172.16.0.0/16"
  private_ip_google_access = "true"
}
# Add a firewall rule to allow HTTP, SSH, and RDP traffic on securenetwork
resource "google_compute_firewall" "securenetwork-allow-http-ssh-rdp-icmp" {
  name = "securenetwork-allow-http-ssh-rdp-icmp"
  network = "${google_compute_network.securenetwork.self_link}"
  allow {
      protocol = "tcp"
      ports    = ["22", "80", "3389"] 
  }
  allow {
      protocol = "icmp"
  }
}
# Add the vm-securehost instance
module "vm-securehost" {
  source              = "./instance"
  instance_name       = "vm-securehost"
  instance_zone       = "us-central1-a"
  instance_type       = "n1-standard-1"
  instance_imagetype  = "windows-cloud/windows-2016"
  instance_subnetwork = "${google_compute_subnetwork.securesubnet-us.self_link}"
  instance_subnetwork1 = "default"
}
# Add the vm-bastionhost instance
module "vm-bastionhost" {
  source              = "./instance"
  instance_name       = "vm-bastionhost"
  instance_zone       = "us-central1-a"
  instance_type       = "n1-standard-1"
  instance_imagetype  = "windows-cloud/windows-2016"
  instance_subnetwork = "${google_compute_subnetwork.securesubnet-us.self_link}"
  instance_subnetwork1 = "default"
}
