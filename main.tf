resource "oci_database_management_cloud_cluster" "database_management_cloud_clusters" {
  for_each = var.database_management_cloud_clusters

  cloud_cluster_id   = each.value.cloud_cluster_id
  cloud_connector_id = each.value.cloud_connector_id
  defined_tags       = each.value.defined_tags
  freeform_tags      = each.value.freeform_tags

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

