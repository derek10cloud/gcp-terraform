resource "google_cloudfunctions2_function" "hello_function" {
  name        = "hello-function"
  location    = var.region
  description = "test function"
  event_trigger {
    event_type            = "google.cloud.pubsub.topic.v1.messagePublished"
    pubsub_topic          = "projects/${var.project_id}/topics/${google_pubsub_topic.hello_topic.id}"
    trigger_region        = var.region
    retry_policy          = "RETRY_POLICY_DO_NOT_RETRY"
  }
  build_config {
    runtime     = var.runtime
    entry_point = "test"
    source {
      storage_source {
        bucket = var.bucket_name
        object = var.object_name
      }
    }
  }
  service_config {
    timeout_seconds    = 60
    max_instance_count = 30
    available_memory   = "256"
  }
}

output "function_name" {
  value = google_cloudfunctions2_function.hello_function.name
}
