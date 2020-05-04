variable "name" {
  description = "Name of the Helm release"
}

variable "namespace" {
  description = "Namespace of the Helm release"
}

variable "issuer_dns" {
  description = "Enable or disable DNS challange Cluster Issuer"
}

variable "cert_manager_helm_values" {
  description = "Helm values for cert manager chart."
}

variable "chart_version" {
  description = "Version of the chart to install"
}

variable "init_chart_version" {
  description = "Version of the init chart to install"
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
