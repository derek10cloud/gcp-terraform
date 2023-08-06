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
    prefix = "example/vpn"
  }

}

provider "google" {
  // project = "project-id"
  region  = "asia-northeast3"
}

// gcp 기본 구성(project, region 등) 참조용
data "google_client_config" "this" {}

// secret 참조용
data "terraform_remote_state" "asne3_common_net_secrets" {
  backend = "gcs"

  config = {
    // bucket = "bucket-name"
    prefix = "example/vpn/secrets"
  }
}
