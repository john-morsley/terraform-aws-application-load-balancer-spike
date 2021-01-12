/*
 _______                   __
|__   __|                 / _|
   | | ___ _ __ _ __ __ _| |_ ___  _ __ _ __ ___
   | |/ _ \ '__| '__/ _` |  _/ _ \| '__| '_ ` _ \
   | |  __/ |  | | | (_| | || (_) | |  | | | | | |
   |_|\___|_|  |_|  \__,_|_| \___/|_|  |_| |_| |_|

                                                */
terraform {

  required_version = ">= 0.14"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.22.0"
    }

//    local = {
//      source  = "hashicorp/local"
//      version = ">= 2.0.0"
//    }
//
//    null = {
//      source  = "hashicorp/null"
//      version = ">= 3.0.0"
//    }
//
//    random = {
//      source  = "hashicorp/random"
//      version = ">= 3.0.0"
//    }
//
//    rke = {
//      source  = "rancher/rke"
//      version = ">= 1.1.6"
//    }
//
//    tls = {
//      source  = "hashicorp/tls"
//      version = ">= 3.0.0"
//    }

  }

  # Requires the following environment variables:

  # AWS_ACCESS_KEY_ID
  # AWS_SECRET_ACCESS_KEY

  backend "s3" {
    bucket         = "morsley-io-terraform-backend-states"
    key            = "spikes/application_load_balancer"
    region         = "eu-west-2"
    dynamodb_table = "morsley-io-terraform-state-locks"
    encrypt        = true
  }

}