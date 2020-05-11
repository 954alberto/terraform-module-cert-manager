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

# Create Cluster Issuer Using DNS01 challange

data "template_file" "cluster_issuer_dns" {
  template = file("${path.module}/templates/cluster_issuer_dns.yaml")
  vars = {
    name     = var.cluster_issuer_name
    zones    = var.zones
    email    = var.email
    region   = var.region
    dns_role = var.route53_role_arn
  }
}

resource "helm_release" "cert-manager" {
  name      = var.name
  namespace = var.namespace
  chart     = "${var.chart_repository}/${var.name}"
  version   = var.chart_version
  values    = [var.cert_manager_helm_values]
}

resource "helm_release" "cluster-issuer-dns" {
  count      = var.issuer_dns
  depends_on = [helm_release.cert-manager]
  name       = "cluster-issuer-dns"
  namespace  = var.namespace
  chart      = "sbp/anything"
  version    = "3.0.2"
  values     = [data.template_file.cluster_issuer_dns.rendered]
}