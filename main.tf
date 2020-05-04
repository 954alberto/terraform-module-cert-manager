resource "kubernetes_namespace" "cert-manager" {
  metadata {
    name = var.namespace
  }
}

data "helm_repository" "jetstack" {
  name = "jetstack"
  url  = "https://charts.jetstack.io"
}

data "helm_repository" "sbp" {
  name = "sbp"
  url  = "https://s3-eu-west-1.amazonaws.com/sbp-charts"
}

# Create Cert manager CRD's

resource "helm_release" "cert-manager-init" {
  name      = "${var.name}-init"
  namespace = var.namespace
  version   = var.init_chart_version
  chart     = "sbp/${var.name}-init"
}


# Create Cluster Issuer using HTTP01 challange

data "template_file" "cluster_issuer_http" {
  template = file("${path.module}/templates/cluster_issuer_http.yaml")
}

resource "helm_release" "cluster-issuer-http" {
  count      = var.issuer_http
  depends_on = [helm_release.cert-manager-init]
  name       = "cluster-issuer-http"
  namespace  = var.namespace
  chart      = "sbp/anything"
  values     = [data.template_file.cluster_issuer_http.rendered]
}

# Create Cluster Issuer with Self Signed CA

data "template_file" "cluster_issuer_selfsigned" {
  template = file("${path.module}/templates/cluster_issuer_selfsigned.yaml")
}

resource "kubernetes_secret" "self_signed_ca" {
  count = var.issuer_selfsigned
  metadata {
    name      = "self-signed-ca-key-pair"
    namespace = var.namespace
  }

  data = var.self_signed_key_pair

  type = "kubernetes.io/tls"
}

resource "helm_release" "cluster-issuer-self-signed" {
  count      = var.issuer_selfsigned
  depends_on = [helm_release.cert-manager-init]
  name       = "cluster-issuer-selfsigned"
  namespace  = var.namespace
  chart      = "sbp/anything"
  values     = [data.template_file.cluster_issuer_selfsigned.rendered]
}

resource "helm_release" "cert-manager" {
  name      = var.name
  namespace = var.namespace
  chart     = "jetstack/${var.name}"
  version   = var.chart_version
  values    = [var.cert_manager_helm_values]
}

