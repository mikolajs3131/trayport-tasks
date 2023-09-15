variable "staging" {
  description = ""

  type = map(object({
    location = string
    sku = string
    queues = map(object({
      name = string
      enable_partitioning = bool
    }))
    tags = map(string)
  }))
}

resource "azurerm_resource_group" "staging" {
  for_each = var.staging

  name     = "staging-rg-${each.key}"
  location = each.value.location

  tags = merge(local.global_tags, var.staging[each.key].tags)

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_servicebus_namespace" "staging" {
  for_each            = var.staging

  name                = "staging-asn-${each.key}"
  location            = azurerm_resource_group.staging[each.key].location
  resource_group_name = azurerm_resource_group.staging[each.key].name
  sku                 = var.staging[each.key].sku

  tags = merge(local.global_tags, var.staging[each.key].tags)

  lifecycle {
    prevent_destroy = true
  }
}

locals {
  staging_flattened_queues = flatten([
    for asn_key, value in var.staging : [
      for queue_key, original_queues_value in value.queues : merge(original_queues_value, {
        namespace_key = asn_key
        queue_key     = queue_key
      })
    ]
  ])

  staging_queues_map = { for value in local.staging_flattened_queues :
    "${value.namespace_key}.${value.queue_key}" => value
  }
}

resource "azurerm_servicebus_queue" "staging" {
  for_each            = local.staging_queues_map

  name                = each.value.name
  namespace_id        = azurerm_servicebus_namespace.staging[each.value.namespace_key].id

  enable_partitioning = each.value.enable_partitioning

  lifecycle {
    prevent_destroy = true
  }
}
