resource "kubernetes_namespace" "cert-manager" {
  metadata {
    name = var.namespace
  }
}

data "helm_repository" "jetstack" {
  name = "jetstack"
  url  = "https://charts.jetstack.io"
}


# Create Cert manager CRD's

resource "helm_release" "cert-manager-init" {
  name      = "${var.name}-init"
  namespace = var.namespace
  version   = var.init_chart_version
  chart     = "sbp/${var.name}-init"
}


resource "helm_release" "cert-manager" {
  name      = var.name
  namespace = var.namespace
  chart     = "${var.chart_repository}/${var.name}"
  version   = var.chart_version
  values    = [var.cert_manager_helm_values]
}
