variable "name" {
  description = "Name of the Helm release"
}

variable "namespace" {
  description = "Namespace of the Helm release"
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
  default     = "0.10.0"
}

variable "init_chart_version" {
  description = "Version of the init chart to install"
  default     = "1.1.0"
}