# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork

resource "google_compute_subnetwork" "test-internal-001" {
  name                     = "test-internal-001"
  ip_cidr_range            = "10.250.99.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.test.id
  private_ip_google_access = true
}

