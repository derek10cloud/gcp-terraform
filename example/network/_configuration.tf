terraform {
  required_version = "1.1.7"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.68.0"
    }

  }
  backend "gcs" {
    // bucket = "bucket-name"
    prefix = "example/network"
  }

}

provider "google" {
  // project = "project-id"
  region  = "global"
}

data "google_project" "project" {}
data "google_compute_regions" "available" {}

