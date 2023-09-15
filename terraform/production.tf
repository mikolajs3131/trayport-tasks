variable "production" {
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

resource "azurerm_resource_group" "production" {
  for_each = var.production

  name     = "production-rg-${each.key}"
  location = each.value.location

  tags = merge(local.global_tags, var.production[each.key].tags)

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_servicebus_namespace" "production" {
  for_each            = var.production

  name                = "production-asn-${each.key}"
  location            = azurerm_resource_group.production[each.key].location
  resource_group_name = azurerm_resource_group.production[each.key].name
  sku                 = var.production[each.key].sku

  tags = merge(local.global_tags, var.production[each.key].tags)

  lifecycle {
    prevent_destroy = true
  }
}

locals {
  production_flattened_queues = flatten([
    for asn_key, value in var.production : [
      for queue_key, original_queues_value in value.queues : merge(original_queues_value, {
        namespace_key = asn_key
        queue_key     = queue_key
      })
    ]
  ])

  production_queues_map = { for value in local.production_flattened_queues :
    "${value.namespace_key}.${value.queue_key}" => value
  }
}

resource "azurerm_servicebus_queue" "production" {
  for_each            = local.production_queues_map

  name                = each.value.name
  namespace_id        = azurerm_servicebus_namespace.production[each.value.namespace_key].id

  enable_partitioning = each.value.enable_partitioning

  lifecycle {
    prevent_destroy = true
  }
}
