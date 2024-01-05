# Configure Aviatrix provider source and version
terraform {
  required_providers {
    aviatrix = {
      source = "AviatrixSystems/aviatrix"
      version = "3.1.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure Aviatrix provider
provider "aviatrix" {
  # controller_ip           = "44.193.146.71"
  # username                = "admin"
  # password                = "B]L+fo:?]9F4s$&O?2vh"
  # skip_version_validation = false
  # verify_ssl_certificate  = true
  # path_to_ca_certificate  = "/path/to/ca/cert.crt"
}

provider "aws" {
  alias = "uw1"
  region = "us-west-1"
}

provider "aws" {
  alias = "ec1"
  region = "eu-central-1"
}