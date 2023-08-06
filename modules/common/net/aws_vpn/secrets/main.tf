# secret value는 사용자가 수동 입력
resource "google_secret_manager_secret" "peer_vpn_gw_ip" {
  # for_each = local.peer_vpn_gw_names

  secret_id = "${var.peer_vpn_gw_ip_name}_aws-gw-ip"

  replication {
    user_managed {
      replicas {
        location = local.region
      }
    }
  }
  labels = var.labels
}

resource "google_secret_manager_secret" "pre_shared_key" {
  # for_each = local.peer_vpn_gw_names

  secret_id = "${var.peer_vpn_gw_ip_name}_pre-shared-key"

  replication {
    user_managed {
      replicas {
        location = local.region
      }
    }
  }
  labels = var.labels
}

resource "google_secret_manager_secret" "gcp_bgp_ip" {
  # for_each = local.peer_vpn_gw_names

  secret_id = "${var.peer_vpn_gw_ip_name}_gcp-bgp-ip"

  replication {
    user_managed {
      replicas {
        location = local.region
      }
    }
  }
  labels = var.labels
}

resource "google_secret_manager_secret" "aws_bgp_ip" {
  # for_each = local.peer_vpn_gw_names

  secret_id = "${var.peer_vpn_gw_ip_name}_aws-bgp-ip"

  replication {
    user_managed {
      replicas {
        location = local.region
      }
    }
  }
  labels = var.labels
}
