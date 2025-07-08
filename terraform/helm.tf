resource "helm_release" "cloudflared" {
  name       = "cloudflare"
  namespace  = "cloudflare"
  repository = "https://cloudflare.github.io/helm-charts"
  chart      = "cloudflare-tunnel"
  version    = "0.3.2" # https://github.com/cloudflare/helm-charts/blob/main/charts/cloudflare-tunnel/Chart.yaml

  values = [
    file("${path.module}/helm/cloudflared-tunnel-values.yaml")
  ]

  depends_on = [kubernetes_secret.cloudflared_credentials]
}