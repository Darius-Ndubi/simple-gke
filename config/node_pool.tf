
// resource to create the node pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.cluster_name}-pool"
  location   = var.location
  cluster    = google_container_cluster.primary.name
  node_count = var.min_nodes

 // parameters used in creating the default node pool
  node_config {
    machine_type = var.machine_type

    // set of google API's made available on all of the nodes
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  autoscaling {
    min_node_count = var.min_nodes
    max_node_count = var.max_nodes
  }

   management {
    auto_repair     = true
    auto_upgrade    = true
  }
}
