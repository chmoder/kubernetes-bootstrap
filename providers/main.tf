# data "google_client_config" "example" {}

# # locals {
# #   k8_provider_config = {
# #     host                   = "https://${google_container_cluster.primary.endpoint}"
# #     token                  = data.google_client_config.example.access_token
# #     cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)

# #     ignore_annotations = [
# #       "^autopilot\\.gke\\.io\\/.*",
# #       "^cloud\\.google\\.com\\/.*"
# #     ]
# #   }
# # }

# terraform {
#   required_providers {
#     google = {
#       source  = "hashicorp/google"
#       version = "5.41.0"
#     }
#     kubernetes = {
#       source  = "hashicorp/kubernetes"
#       version = "2.32.0"
#     }
#     kubectl = {
#       source  = "alekc/kubectl"
#       version = "2.0.4"
#     }
#     cloudflare = {
#       source  = "cloudflare/cloudflare"
#       version = "4.39.0"
#     }
#     helm = {
#       source  = "hashicorp/helm"
#       version = "2.15.0"
#     }
#     newrelic = {
#       source  = "newrelic/newrelic"
#       version = "3.45.0"
#     }
#     graphql = {
#       source  = "sullivtr/graphql"
#       version = "2.5.5"
#     }
#   }
# }

# # provider "kubernetes" {
# #   host                   = local.k8_provider_config.host
# #   token                  = local.k8_provider_config.token
# #   cluster_ca_certificate = local.k8_provider_config.cluster_ca_certificate

# #   ignore_annotations = local.k8_provider_config.ignore_annotations
# # }

# # provider "kubectl" {
# #   host                   = local.k8_provider_config.host
# #   token                  = local.k8_provider_config.token
# #   cluster_ca_certificate = local.k8_provider_config.cluster_ca_certificate
# # }

# provider "google" {
#   credentials = file(var.sa_credentials_file_path)
#   project     = var.project_id
#   region      = var.project_region
# }

# provider "kubernetes" {
#   host  = "https://${data.google_container_cluster.primary.endpoint}"
#   token = data.google_client_config.example.access_token
#   cluster_ca_certificate = base64decode(
#     data.google_container_cluster.primary.master_auth[0].cluster_ca_certificate,
#   )
#   exec {
#     api_version = "client.authentication.k8s.io/v1beta1"
#     command     = "gke-gcloud-auth-plugin"
#   }
# }

# provider "kubectl" {
#   host  = "https://${data.google_container_cluster.primary.endpoint}"
#   token = data.google_client_config.example.access_token
#   cluster_ca_certificate = base64decode(
#     data.google_container_cluster.primary.master_auth[0].cluster_ca_certificate,
#   )
#   exec {
#     api_version = "client.authentication.k8s.io/v1beta1"
#     command     = "gke-gcloud-auth-plugin"
#   }
# }

# provider "helm" {
#   kubernetes {
#     host  = "https://${data.google_container_cluster.primary.endpoint}"
#     token = data.google_client_config.example.access_token
#     cluster_ca_certificate = base64decode(
#       data.google_container_cluster.primary.master_auth[0].cluster_ca_certificate,
#     )
#     exec {
#       api_version = "client.authentication.k8s.io/v1beta1"
#       command     = "gke-gcloud-auth-plugin"
#     }
#   }
# }

# provider "cloudflare" {
#   email   = var.cloudflare_email
#   api_key = var.cloudflare_api_key
# }

# provider "newrelic" {
#   account_id = var.nr_account_id
#   api_key    = var.nr_api_key
#   region     = "US"
# }

# provider "graphql" {
#   url = "https://api.newrelic.com/graphql"
#   headers = {
#     "Content-Type" = "application/json"
#     "API-Key"      = var.nr_api_key
#   }
# }
