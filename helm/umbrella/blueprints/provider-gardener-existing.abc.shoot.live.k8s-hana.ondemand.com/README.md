

# provider-gardener-existing

![Version: 0.0.23](https://img.shields.io/badge/Version-0.0.23-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Umbrealla Helm chart which contains crossplane manifests to demonstrate orchestration of (already) existing SAP Gardener Clusters and its stack

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://ghcr.io/openmcp-project | crossplane-gardener-shoot-kubeconfigs(crossplane-gardener-shoot-kubeconfigs) | 0.0.10 |
| oci://ghcr.io/openmcp-project | crossplane-provider-configs(crossplane-provider-configs) | 0.0.19 |
| oci://ghcr.io/openmcp-project | crossplane-provider-helm(crossplane-provider-helm) | 0.0.11 |
| oci://ghcr.io/openmcp-project | external-secrets-config(external-secrets-config) | 0.1.12 |
# TL;DR
This template umbrella Helm Chart demonstrates the orchestration of k8s workload of existing SAP [Gardener](https://gardener.cloud) [Shoot Clusters](https://gardener.cloud/docs/getting-started/shoots/).

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| crossplane-gardener-shoot-kubeconfigs.shootClusters[0].gardenerOrchestrateCloudProviderConfigRefName | string | `"garden-sa-co-mcp-blueprints"` | needs to match ProviderConfig of kubernetes.crossplane.io |
| crossplane-gardener-shoot-kubeconfigs.shootClusters[0].kubernetesCrossplaneProviderConfigRefName | string | `"garden-sa-co-mcp-blueprints"` |  |
| crossplane-gardener-shoot-kubeconfigs.shootClusters[0].name | string | `"iad-test"` |  |
| crossplane-gardener-shoot-kubeconfigs.shootClusters[0].projectNamespace | string | `"garden-co-golden"` |  |
| crossplane-provider-configs.providerConfigs.gardenerOrchestrateCloud[0].credentials.secretRef.key | string | `"kubeconfig"` |  |
| crossplane-provider-configs.providerConfigs.gardenerOrchestrateCloud[0].credentials.secretRef.name | string | `"garden-co-golden"` |  |
| crossplane-provider-configs.providerConfigs.gardenerOrchestrateCloud[0].credentials.secretRef.namespace | string | `"default"` |  |
| crossplane-provider-configs.providerConfigs.gardenerOrchestrateCloud[0].credentials.source | string | `"Secret"` |  |
| crossplane-provider-configs.providerConfigs.gardenerOrchestrateCloud[0].providerConfigRefName | string | `"garden-sa-co-mcp-blueprints"` |  |
| crossplane-provider-configs.providerConfigs.helmCrossplane[0].credentials.secretRef.key | string | `"kubeconfig"` |  |
| crossplane-provider-configs.providerConfigs.helmCrossplane[0].credentials.secretRef.name | string | `"gardener-shoot-kubeconfig-iad-test"` |  |
| crossplane-provider-configs.providerConfigs.helmCrossplane[0].credentials.secretRef.namespace | string | `"default"` |  |
| crossplane-provider-configs.providerConfigs.helmCrossplane[0].credentials.source | string | `"Secret"` |  |
| crossplane-provider-configs.providerConfigs.helmCrossplane[0].providerConfigRefName | string | `"gardener-shoot-iad-test"` |  |
| crossplane-provider-configs.providerConfigs.kubernetesCrossplane[0].credentials.secretRef.key | string | `"kubeconfig"` |  |
| crossplane-provider-configs.providerConfigs.kubernetesCrossplane[0].credentials.secretRef.name | string | `"garden-co-golden"` |  |
| crossplane-provider-configs.providerConfigs.kubernetesCrossplane[0].credentials.secretRef.namespace | string | `"default"` |  |
| crossplane-provider-configs.providerConfigs.kubernetesCrossplane[0].credentials.source | string | `"Secret"` |  |
| crossplane-provider-configs.providerConfigs.kubernetesCrossplane[0].providerConfigRefName | string | `"garden-sa-co-mcp-blueprints"` |  |
| crossplane-provider-helm.helmReleases.ingressNginx.chart.name | string | `"ingress-nginx"` |  |
| crossplane-provider-helm.helmReleases.ingressNginx.chart.repository | string | `"https://kubernetes.github.io/ingress-nginx"` |  |
| crossplane-provider-helm.helmReleases.ingressNginx.chart.version | string | `"4.10.0"` |  |
| crossplane-provider-helm.helmReleases.ingressNginx.helmCrossplaneProviderConfigRefName | string | `"gardener-shoot-iad-test"` |  |
| crossplane-provider-helm.helmReleases.ingressNginx.name | string | `"ingress-nginx"` |  |
| crossplane-provider-helm.helmReleases.ingressNginx.namespace | string | `"default"` |  |
| crossplane-provider-helm.helmReleases.ingressNginx.values.controller.config.enable-underscores-in-headers | string | `"true"` |  |
| crossplane-provider-helm.helmReleases.ingressNginx.values.controller.extraArgs.default-ssl-certificate | string | `"default/www-tls"` |  |
| crossplane-provider-helm.helmReleases.ingressNginx.values.controller.ingressClassResource.default | bool | `true` |  |
| crossplane-provider-helm.helmReleases.ingressNginx.values.controller.service.annotations."cert.gardener.cloud/secretname" | string | `"www-tls"` |  |
| crossplane-provider-helm.helmReleases.ingressNginx.values.controller.service.annotations."dns.gardener.cloud/class" | string | `"garden"` |  |
| crossplane-provider-helm.helmReleases.ingressNginx.values.controller.service.annotations."dns.gardener.cloud/dnsnames" | string | `""` |  |
| crossplane-provider-helm.helmReleases.ingressNginx.values.controller.service.annotations."dns.gardener.cloud/ttl" | string | `"600"` |  |
| crossplane-provider-helm.helmReleases.ingressNginx.values.controller.service.appProtocol | bool | `false` |  |
| crossplane-provider-helm.helmReleases.ingressNginx.values.controller.watchIngressWithoutClass | bool | `true` |  |
| crossplane-provider-helm.helmReleases.ingressNginx.values.defaultBackend.enabled | bool | `true` |  |
| crossplane-provider-helm.helmReleases.ingressNginx.values.fullnameOverride | string | `"ingress-nginx"` |  |
| external-secrets-config.externalSecret[0].data[0].remoteRef.key | string | `"btp-endpoint.example/btp-account"` |  |
| external-secrets-config.externalSecret[0].data[0].remoteRef.property | string | `"kubeconfig"` |  |
| external-secrets-config.externalSecret[0].data[0].secretKey | string | `"kubeconfig"` |  |
| external-secrets-config.externalSecret[0].name | string | `"garden-co-golden"` |  |
| external-secrets-config.externalSecret[0].namespace | string | `"default"` |  |
| external-secrets-config.externalSecret[0].refreshInterval | string | `"15m"` |  |
| external-secrets-config.externalSecret[0].secretStore.name | string | `"hashicorp-vault"` |  |
| external-secrets-config.externalSecret[0].targetSecretName | string | `"garden-co-golden"` |  |
| external-secrets-config.secretStores[0].name | string | `"hashicorp-vault"` |  |
| external-secrets-config.secretStores[0].namespace | string | `"default"` |  |
| external-secrets-config.secretStores[0].provider.vault.auth.kubernetes.mountPath | string | `"kubernetes"` |  |
| external-secrets-config.secretStores[0].provider.vault.auth.kubernetes.role | string | `"openmcp-kubernetes"` |  |
| external-secrets-config.secretStores[0].provider.vault.auth.kubernetes.secretRef.key | string | `"token"` |  |
| external-secrets-config.secretStores[0].provider.vault.auth.kubernetes.secretRef.name | string | `"vault-token-sa"` |  |
| external-secrets-config.secretStores[0].provider.vault.auth.kubernetes.secretRef.namespace | string | `"default"` |  |
| external-secrets-config.secretStores[0].provider.vault.namespace | string | `"ns1"` |  |
| external-secrets-config.secretStores[0].provider.vault.path | string | `"mcps"` |  |
| external-secrets-config.secretStores[0].provider.vault.server | string | `"https://vault.example/"` |  |
| external-secrets-config.secretStores[0].provider.vault.version | string | `"v2"` |  |
| tags.crossplane-gardener-shoot-kubeconfigs | bool | `true` |  |
| tags.crossplane-provider-configs | bool | `true` |  |
| tags.crossplane-provider-helm | bool | `true` |  |
| tags.external-secrets-config | bool | `true` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)