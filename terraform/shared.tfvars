test = {
  "ASN0" = { 
    "location" = "westeurope"
    "sku"      = "Standard"

    "queues"   = {
      "q0" = {
        "name" = "queue-00"
        "enable_partitioning" = true
      }
      "q1" = {
        "name" = "queue-01"
        "enable_partitioning" = false
      }
    }

    "tags" = {
      "CostCenter" = "1234"
      "Product"    = "product_name0"
    }
  }

  "ASN1" = {
    "location" = "westeurope"
    "sku"      = "Premium"

    "queues"   = {
      "q0" = {
        "name" = "queue-10"
        "enable_partitioning" = true
      }
      "q1" = {
        "name" = "queue-11"
        "enable_partitioning" = false
      }
      "q2" = {
        "name" = "queue-12"
        "enable_partitioning" = true
      }
      "q3" = {
        "name" = "queue-13"
        "enable_partitioning" = false
      }
    }

    "tags" = {
      "CostCenter" = "4567"
      "Product"    = "product_name1"
    }
  }

  "ASN2" = {
    "location" = "northeurope"
    "sku"      = "Premium"

    "queues"   = {
      "q0" = {
        "name" = "queue-20"
        "enable_partitioning" = true
      }
      "q1" = {
        "name" = "queue-21"
        "enable_partitioning" = false
      }
      "q2" = {
        "name" = "queue-22"
        "enable_partitioning" = false
      }
    }

    "tags" = {
      "CostCenter" = "8901"
      "Product"    = "product_name2"
    }
  }
}

###

staging = {
  "ASN0" = { 
    "location" = "westeurope"
    "sku"      = "Standard"

    "queues"   = {
      "q0" = {
        "name" = "queue-00"
        "enable_partitioning" = true
      }
      "q1" = {
        "name" = "queue-01"
        "enable_partitioning" = false
      }
    }

    "tags" = {
      "CostCenter" = "1234"
      "Product"    = "product_name0"
    }
  }

  "ASN1" = {
    "location" = "westeurope"
    "sku"      = "Premium"

    "queues"   = {
      "q0" = {
        "name" = "queue-10"
        "enable_partitioning" = true
      }
      "q1" = {
        "name" = "queue-11"
        "enable_partitioning" = false
      }
      "q2" = {
        "name" = "queue-12"
        "enable_partitioning" = true
      }
      "q3" = {
        "name" = "queue-13"
        "enable_partitioning" = false
      }
    }

    "tags" = {
      "CostCenter" = "4567"
      "Product"    = "product_name1"
    }
  }

  "ASN2" = {
    "location" = "northeurope"
    "sku"      = "Premium"

    "queues"   = {
      "q0" = {
        "name" = "queue-20"
        "enable_partitioning" = true
      }
      "q1" = {
        "name" = "queue-21"
        "enable_partitioning" = false
      }
      "q2" = {
        "name" = "queue-22"
        "enable_partitioning" = false
      }
    }

    "tags" = {
      "CostCenter" = "8901"
      "Product"    = "product_name2"
    }
  }
}

###
production = {
  "ASN0" = { 
    "location" = "westeurope"
    "sku"      = "Standard"

    "queues"   = {
      "q0" = {
        "name" = "queue-00"
        "enable_partitioning" = true
      }
      "q1" = {
        "name" = "queue-01"
        "enable_partitioning" = false
      }
    }

    "tags" = {
      "CostCenter" = "1234"
      "Product"    = "product_name0"
    }
  }

  "ASN1" = {
    "location" = "westeurope"
    "sku"      = "Premium"

    "queues"   = {
      "q0" = {
        "name" = "queue-10"
        "enable_partitioning" = true
      }
      "q1" = {
        "name" = "queue-11"
        "enable_partitioning" = false
      }
      "q2" = {
        "name" = "queue-12"
        "enable_partitioning" = true
      }
      "q3" = {
        "name" = "queue-13"
        "enable_partitioning" = false
      }
    }

    "tags" = {
      "CostCenter" = "4567"
      "Product"    = "product_name1"
    }
  }

  "ASN2" = {
    "location" = "northeurope"
    "sku"      = "Premium"

    "queues"   = {
      "q0" = {
        "name" = "queue-20"
        "enable_partitioning" = true
      }
      "q1" = {
        "name" = "queue-21"
        "enable_partitioning" = false
      }
      "q2" = {
        "name" = "queue-22"
        "enable_partitioning" = false
      }
    }

    "tags" = {
      "CostCenter" = "8901"
      "Product"    = "product_name2"
    }
  }
}
