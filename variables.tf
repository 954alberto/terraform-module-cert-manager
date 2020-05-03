variable "name" {
  description = "Name of the Helm release"
}

variable "namespace" {
  description = "Namespace of the Helm release"
}

variable "helm_values" {
  description = "Helm values for cosmic cloud controller chart."
}

variable "chart_version" {
  description = "Helm chart version"
}

variable "chart" {
  description = "Helm chart name"
}

variable "helm_repository" {
  description = "Helm repository name"
}

variable "helm_repository_url" {
  description = "Helm repository url"
}

variable "helm_timeout" {
  description = "Helm timeout"
}