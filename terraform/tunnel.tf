resource "cloudflare_zero_trust_tunnel_cloudflared" "basebandit_homelab" {
  account_id    = var.cloudflare_account_id
  name          = "basebandit-lab"
  config_src    = "local"
  tunnel_secret = var.cloudflare_tunnel_secret
}
