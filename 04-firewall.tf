# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall


resource "google_compute_firewall" "ssh" {
  name    = "${google_compute_network.test.name}-allow-ssh"
  network = google_compute_network.test.name
  #direction = "INGRESS" (not needed as it is a default value- see API documentation)

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}


resource "google_compute_firewall" "web_traffic" {
  name    = "${google_compute_network.test.name}-allow-web-traffic"
  network = google_compute_network.test.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

