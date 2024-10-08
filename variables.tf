variable "project_id" {
  type        = string
  description = "GCP project id"
}

variable "project_region" {
  type        = string
  description = "GCP Project Region"
}

variable "sa_credentials_file_path" {
  type        = string
  description = "file path to google service account credentials"
}

variable "sa_email" {
  type        = string
  description = "the terraform admin service account email"
}

variable "cluster_issuer_private_key_secret_name" {
  type        = string
  description = "eventual location of cert-manager tls key and cert"
}

variable "cluster_issuer_email" {
  type        = string
  description = "email address for cert-manager"
}

variable "cloudflare_email" {
  type        = string
  description = "email address for cert-manager"
}

variable "cloudflare_api_key" {
  type        = string
  description = "cloudflare api key for dns01 validation"
}

variable "ingress_hosts" {
  type        = map(map(string))
  description = "hostnames (domains) that will be used in certs and/or routing"
}

variable "name_prefix_kebab" {
  type        = string
  description = "resource name prefix hyphenated"
}

# optional
variable "firewall_allow_ssh" {
  type    = string
  default = "ssh-enabled"
}

variable "firewall_allow_http" {
  type    = string
  default = "http-enabled"
}

variable "firewall_allow_https" {
  type    = string
  default = "https-enabled"
}

variable "nr_account_id" {
  type        = number
  description = "new relic account ID"
}

variable "nr_api_key" {
  type        = string
  description = "new relic api key"
}

variable "nr_sa" {
  type        = string
  description = "new relic service accout"
}

variable "nr_global_license_key" {
  type        = string
  description = "global.licenseKey"
}

variable "nr_newrelic_pixie_api_key" {
  type        = string
  description = "newrelic-pixie.apiKey"
}

variable "nr_pixie_chart_deploy_key" {
  type        = string
  description = "pixie-chart.deployKey"
}

