terraform {
  required_version = ">=0.13"
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "=4.4"
    }
  }
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "calfolguera"

    workspaces {
      name = "oci-always-free"
    }
  }
}

provider oci {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid = var.user_ocid
  fingerprint = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}
