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


variable "email" {
  description = "email address for requests"
}

variable "zones" {
  description = "List of zones"
}

variable "chart_repository" {
  description = "The repository name to download the chart"
}

variable "route53_role_arn" {
  description = "The arn of a role with permissions to update route53 for the hosted zone"
}

variable "cluster_issuer_name" {
  description = "Name of the k8s object"
}
  
