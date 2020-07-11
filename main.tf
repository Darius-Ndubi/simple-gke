provider "google" {
  project     = var.project
  region      = var.region
}

terraform {
  backend "gcs" {
    bucket = "app-infra-storage"
    prefix = "/state"
  }
}

// entry point into the application
module "gke" {
  source       = "./config/"
  project      = var.project
  region       = var.region
  location     = var.location
  cluster_name = var.cluster_name
  machine_type = var.machine_type
  min_nodes    = var.min_nodes
  max_nodes    = var.max_nodes
}
