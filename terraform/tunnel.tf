resource "cloudflare_zero_trust_tunnel_cloudflared" "basebandit_homelab" {
  account_id = var.cloudflare_account_id
  name       = "homelab"
  config_src = "cloudflare" # managed remotely - default is "local"
}


locals {
  ingress_rules = [
    for service in var.services : {
      hostname = service.hostname
      origin_request = {
        no_tls_verify = true
      }
      service = service.service
    }
  ]
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "basebandit_homelab" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.basebandit_homelab.id
  config = {
    ingress = concat(local.ingress_rules, [
      {
        origin_request = {
          connect_timeout        = 0
          keep_alive_connections = 0
          keep_alive_timeout     = 0
          tcp_keep_alive         = 0
          tls_timeout            = 0
        }
        service = "http_status:503" # catch-all rule
      },
    ])
    warp_routing = {
      enabled = false
    }
  }
}
