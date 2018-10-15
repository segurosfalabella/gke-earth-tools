resource "google_container_cluster" "tools" {
  name               = "${var.cluster_name}-${var.environment}"
  project            = "${var.project}"
  zone               = "${var.zone}"
  initial_node_count = "${var.node_count}"
  min_master_version = "${var.min_master_ver}"
  node_version       = "${var.node_version}"

  master_auth {
    username = "${var.remote_user}"
    password = "${var.remote_pass}"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels {
      environment = "${var.environment}"
    }

    machine_type = "${var.machine_type}"
    disk_type    = "${var.disk_type}"
  }
}

output "client_certificate" {
  value = "${google_container_cluster.tools.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.tools.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.tools.master_auth.0.cluster_ca_certificate}"
}

output "endpoint" {
  value = "${google_container_cluster.tools.endpoint}"
}

output "master_version" {
  value = "${google_container_cluster.tools.master_version}"
}
