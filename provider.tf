terraform {
  required_version = ">=0.13"
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "=4.4"
    }
  }
}

provider oci {
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
}
