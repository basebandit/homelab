resource "helm_release" "cloudflared" {
  name       = "cloudflare"
  namespace  = "cloudflare"
  repository = "https://cloudflare.github.io/helm-charts"
  chart      = "cloudflare-tunnel-remote"
  version    = "0.1.2" # https://github.com/cloudflare/helm-charts/blob/main/charts/cloudflare-tunnel-remote/Chart.yaml

  values = [
    templatefile("${path.module}/helm/cloudflared-remote-tunnel-values.yaml.tmpl", {
      cloudflare_tunnel_token = var.cloudflare_tunnel_token
    })
  ]
}