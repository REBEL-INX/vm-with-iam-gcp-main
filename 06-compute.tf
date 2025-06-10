resource "google_compute_instance" "sample_vm" {
  name         = "public-iowa-web-server"
  machine_type = "e2-medium"
  zone         = "us-central1-a"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.test-internal-001.name
    access_config {
      // Ephemeral public IP
    }
  }

    service_account {
        # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
        email  = google_service_account.vm_storage.email
        scopes = ["cloud-platform"]
    }
  metadata_startup_script = file("./startup-00-ref.sh")

}