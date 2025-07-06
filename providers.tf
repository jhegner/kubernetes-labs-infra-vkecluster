terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.26.0"
    }
  }
}

provider "vultr" {
  api_key = var.VULTR_API_KEY
}
