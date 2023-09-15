variable "test" {
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

resource "azurerm_resource_group" "test" {
  for_each = var.test

  name     = "test-rg-${each.key}"
  location = each.value.location

  tags = merge(local.global_tags, var.test[each.key].tags)

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_servicebus_namespace" "test" {
  for_each            = var.test

  name                = "test-asn-${each.key}"
  location            = azurerm_resource_group.test[each.key].location
  resource_group_name = azurerm_resource_group.test[each.key].name
  sku                 = var.test[each.key].sku

  tags = merge(local.global_tags, var.test[each.key].tags)

  lifecycle {
    prevent_destroy = true
  }
}

locals {
  test_flattened_queues = flatten([
    for asn_key, value in var.test : [
      for queue_key, original_queues_value in value.queues : merge(original_queues_value, {
        namespace_key = asn_key
        queue_key     = queue_key
      })
    ]
  ])

  test_queues_map = { for value in local.test_flattened_queues :
    "${value.namespace_key}.${value.queue_key}" => value
  }
}

resource "azurerm_servicebus_queue" "test" {
  for_each            = local.test_queues_map

  name                = each.value.name
  namespace_id        = azurerm_servicebus_namespace.test[each.value.namespace_key].id

  enable_partitioning = each.value.enable_partitioning

  lifecycle {
    prevent_destroy = true
  }
}
