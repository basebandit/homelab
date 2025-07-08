resource "kubernetes_secret" "cloudflared_credentials" {
  metadata {
    name      = "cloudflare-tunnel-creds"
    namespace = "cloudflare"
  }

  data = {
    "credentials.json" = base64encode(jsonencode({
      AccountTag   = var.cloudflare_account_id,
      TunnelSecret = var.cloudflare_tunnel_secret,
      TunnelID     = cloudflare_zero_trust_tunnel_cloudflared.basebandit_homelab.id
      Endpoint     = ""
    }))
  }

  type = "Opaque"
}