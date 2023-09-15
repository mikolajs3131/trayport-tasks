provider "azurerm" {
  features {}
  skip_provider_registration = true
}

locals {
  global_tags = {
    "terraform" = "true"
  }
}
