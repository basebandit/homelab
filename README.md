# 🏡 Homelab - Exposing Kubernetes Cluster with Cloudflare Zero Trust

This project automates the provisioning and exposure of a self-hosted Kubernetes homelab to the internet using **Cloudflare Zero Trust Tunnels**, **Helm**, and **Terraform**.

It is built with **repeatability and portability** in mind, easily reproduce the same infrastructure across machines or rebuild from scratch.

---

## 🚀 What’s Included

- ✅ Cloudflare Zero Trust Tunnel (Terraform managed)
- ✅ Helm-deployed `cloudflared` connector
- ✅ Kubernetes secret for tunnel credentials
- ✅ Terraform configuration for all components
- ⏳ ExternalDNS (coming soon)

---

## 📁 Project Structure

```bash
.
├── helm
│   └── cloudflare-tunnel-values.yaml
├── LICENSE
├── package-lock.json
├── package.json
├── README.md
└── terraform
    ├── helm.tf
    ├── kubernetes.tf
    ├── provider.tf
    ├── terraform.tfstate
    ├── tunnel.tf
    └── variables.tf
```

---

## ⚙️ Requirements

- Terraform `>= 1.3`
- Helm 3
- `kubectl` configured with access to your Kubernetes cluster (`~/.kube/config`)
- A Cloudflare account with:
  - A registered domain
  - An Account API Token with the permissions:
    - `Cloudflare Tunnel:Edit`
    - `Zero Trust:Edit`
    - `DNS:Edit` (for All Zones or at least the zone you’ll use)

---

## 🛠 Usage

```bash
# Clone the repo
git clone https://github.com/basebandit/homelab.git
cd homelab

# Set environment variables or use terraform.tfvars
export TF_VAR_cloudflare_account_api_token="your_cf_account_token_here"
export TF_VAR_cloudflare_zone_id="your_cf_zone_id_here"
export TF_VAR_cloudflare_account_id="your_cf_account_id_here"
export TF_VAR_cloudflare_account_email="your_cf_account_email_here"
export TF_VAR_cloudflare_tunnel_secret="your_cf_tunnel_secret_here"

# Initialize and apply
terraform init
terraform plan
terraform apply
```
