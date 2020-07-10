
// resource to create the node pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.cluster_name}-pool"
  location   = var.location
  cluster    = google_container_cluster.primary.name
  node_count = 2

 // parameters used in creating the default node pool
  node_config {
    machine_type = var.machine_type

     metadata = {
      disable-legacy-endpoints = "true"
    }
    // set of google API's made available on all of the nodes
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
    ]
  }

  autoscaling {
    min_node_count = "2"
    max_node_count = "4"
  }

   management {
    auto_repair     = true
    auto_upgrade    = true
  }
}
