variable "name" {
  description = "Name of the Helm release"
  default     = "cert-manager"
}

variable "namespace" {
  description = "Namespace of the Helm release"
  default     = "cert-manager"
}

variable "issuer_dns" {
  description = "Enable or disable DNS challange Cluster Issuer"
  default     = 1
}

variable "issuer_http" {
  description = "Enable or disable HTTP challange Cluster Issuer"
  default     = 1
}

variable "issuer_selfsigned" {
  description = "Enable or disable Self Signed Cluster Issuer"
  default     = 0
}

variable "cert_manager_helm_values" {
  description = "Helm values for cert manager chart."
}

variable "self_signed_key_pair" {
  description = "A map with the CA cert and key"
  default     = {}
}

variable "chart_version" {
  description = "Version of the chart to install"
  default     = "0.14.1"
}

variable "init_chart_version" {
  description = "Version of the init chart to install"
  default     = "1.1.0"
}

variable "hosted_zone_id" {
  description = "The hosted zone id to populate for challenges"
}

variable "email" {
  description = "email address for requests"
}

variable "region" {
  description = "aws region"
}

variable "chart_repository" {
  description = "The repository name to download the chart"
}

variable "route53_role_arn" {
  description = "The arn of a role with permissions to update route53 for the hosted zone"
}
