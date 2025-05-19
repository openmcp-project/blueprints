[package]
name = "landscape-provider-cfgs-credentials"
edition = "v0.11.1"
version = "0.0.1"

[dependencies]
externalsecretsconfig = { git = "https://github.com/wchomik/kcl-external-secrets-config.git", branch = "main", version = "0.0.2" }

[profile]
entries = ["main.k", "${externalsecretsconfig:KCL_MOD}/render/k8s/kubernetes_render.k"]