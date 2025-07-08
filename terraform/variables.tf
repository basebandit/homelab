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

variable "cloudflare_account_email" {
  description = "Email address for your Cloudflare account"
  type        = string
  sensitive   = true
}

variable "cloudflare_account_api_token" {
  description = "Cloudflare Account API token with permissions for DNS, Tunnel, Zero Trust and Zone access"
  type        = string
  sensitive   = true
}

variable "cloudflare_tunnel_secret" {
  description = "A 64 long random string"
  type        = string
  sensitive   = true
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