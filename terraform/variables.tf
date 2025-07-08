variable "cloudflare_zone_id" {
  description = "Zone ID for your Cloudflare domain"
  type        = string
  sensitive   = true
}

variable "cloudflare_account_id" {
  description = "Account ID for your Cloudflare account"
  type        = string
  sensitive   = true
}

variable "cloudflare_account_api_token" {
  description = "Cloudflare Account API token with permissions for DNS, Tunnel, Zero Trust and Zone access"
  type        = string
  sensitive   = true
}

variable "cloudflare_tunnel_token" {
  description = "Token for your remotely managed cloudflare tunnel"
  type        = string
  sensitive   = true
}

variable "services" {
  description = "Values for the services to be exposed via Cloudflare Tunnel"
  type = map(object({
    hostname = string # public domain name. ex: "service.example.com"
    service  = string # private service endpoint. ex: https://service.apps.internaldomain.com
  }))
  default = {
    "k8s" = {
      hostname = "k8s.infradigest.com"
      service  = "https://kubernetes.default.svc.cluster.local:443"
    }
  }
}

variable "kubeconfig_path" {
  description = "Path to your kubeconfig file"
  type        = string
  default     = "~/.kube/config"
}

variable "kubeconfig_context" {
  description = "Name of your kubernetes config context"
  type        = string
  default     = "kubernetes-admin@kubernetes"
}