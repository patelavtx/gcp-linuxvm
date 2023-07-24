# Terraform-GCP Ubuntu VM

Create a Ubuntu VM in GCP.


## Usage

Note/. labels default is 'env = "test"'   labels parameter below can be omitted or added to override default.

```

module "gcp-linuxvm-spoke1" {
  source = "github.com/patelavtx/gcp-linuxvm.git"
  vm_name = var.vm_name
  vpc_name = "gcpspoke1"
  network_subnet_name =  "gcpspoke1"
  gcp_zone = var.gcp_zone
  labels = var.labels       
}
```

## Provider 

****For TFC GOOGLE_CREDENTIALS will be needed and 'credentials in provider omitted'**




```
terraform {
  required_version = "~> 1.0"

  required_providers {
    google = {
      source = "hashicorp/google"
      // version = "4.11.0" # pinning version
    
  }
}

provider "google" {
  credentials = file(var.gcp_auth_file)  
  project     = var.gcp_project
  region      = var.gcp_region
  zone        = var.gcp_zone
}
```