# TL;DR
This template umbrella Helm Chart demonstrates the orchestration of SAP [Gardener](https://gardener.cloud) [Shoot Clusters](https://gardener.cloud/docs/getting-started/shoots/) and their k8s workloads.

# provider-gardener

![Version: 0.0.20](https://img.shields.io/badge/Version-0.0.20-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Umbrealla Helm chart which contains crossplane manifests to demonstrate orchestration of new SAP Gardener Clusters and its stack

## Requirements

| Repository | Name | Version |
|------------|------|---------|
|  https://raw.githubusercontent.com/openmcp-project/blueprint-building-blocks/gh-pages/ | crossplane-gardener-shoot-clusters(crossplane-gardener-shoot-clusters) | 0.0.8 |
|  https://raw.githubusercontent.com/openmcp-project/blueprint-building-blocks/gh-pages/ | crossplane-provider-configs(crossplane-provider-configs) | 0.0.15 |
|  https://raw.githubusercontent.com/openmcp-project/blueprint-building-blocks/gh-pages/ | crossplane-provider-helm(crossplane-provider-helm) | 0.0.8 |
|  https://raw.githubusercontent.com/openmcp-project/blueprint-building-blocks/gh-pages/ | external-secrets-config(external-secrets-config) | 0.1.7 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| crossplane-gardener-shoot-clusters.kubernetesVersion | string | `"1.30.2"` |  |
| crossplane-gardener-shoot-clusters.shootClusters[0].cloudProfile | string | `"gcp"` |  |
| crossplane-gardener-shoot-clusters.shootClusters[0].gardenerOrchestrateCloudProviderConfigRefName | string | `"garden-co-golden"` |  |
| crossplane-gardener-shoot-clusters.shootClusters[0].kubernetesCrossplaneProviderConfigRefName | string | `"garden-co-golden"` |  |
| crossplane-gardener-shoot-clusters.shootClusters[0].kubernetesVersion | string | `"1.30.2"` |  |
| crossplane-gardener-shoot-clusters.shootClusters[0].name | string | `"iad-test"` |  |
| crossplane-gardener-shoot-clusters.shootClusters[0].projectNamespace | string | `"garden-co-golden"` |  |
| crossplane-gardener-shoot-clusters.shootClusters[0].purpose | string | `"testing"` |  |
| crossplane-gardener-shoot-clusters.shootClusters[0].region | string | `"europe-west1"` |  |
| crossplane-gardener-shoot-clusters.shootClusters[0].secretBindingName | string | `"gcp-sa-garden-co-golden"` |  |
| crossplane-provider-configs.providerConfigs.gardenerOrchestrateCloud[0].credentials.secretRef.key | string | `"kubeconfig"` |  |
| crossplane-provider-configs.providerConfigs.gardenerOrchestrateCloud[0].credentials.secretRef.name | string | `"garden-co-golden"` |  |
| crossplane-provider-configs.providerConfigs.gardenerOrchestrateCloud[0].credentials.secretRef.namespace | string | `"default"` |  |
| crossplane-provider-configs.providerConfigs.gardenerOrchestrateCloud[0].credentials.source | string | `"Secret"` |  |
| crossplane-provider-configs.providerConfigs.gardenerOrchestrateCloud[0].providerConfigRefName | string | `"garden-co-golden"` |  |
| crossplane-provider-configs.providerConfigs.helmCrossplane[0].credentials.secretRef.key | string | `"kubeconfig"` |  |
| crossplane-provider-configs.providerConfigs.helmCrossplane[0].credentials.secretRef.name | string | `"gardener-shoot-kubeconfig-iad-test"` |  |
| crossplane-provider-configs.providerConfigs.helmCrossplane[0].credentials.secretRef.namespace | string | `"default"` |  |
| crossplane-provider-configs.providerConfigs.helmCrossplane[0].credentials.source | string | `"Secret"` |  |
| crossplane-provider-configs.providerConfigs.helmCrossplane[0].providerConfigRefName | string | `"gardener-shoot-iad-test"` |  |
| crossplane-provider-configs.providerConfigs.kubernetesCrossplane[0].credentials.secretRef.key | string | `"kubeconfig"` |  |
| crossplane-provider-configs.providerConfigs.kubernetesCrossplane[0].credentials.secretRef.name | string | `"garden-co-golden"` |  |
| crossplane-provider-configs.providerConfigs.kubernetesCrossplane[0].credentials.secretRef.namespace | string | `"default"` |  |
| crossplane-provider-configs.providerConfigs.kubernetesCrossplane[0].credentials.source | string | `"Secret"` |  |
| crossplane-provider-configs.providerConfigs.kubernetesCrossplane[0].providerConfigRefName | string | `"garden-co-golden"` |  |
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
| external-secrets-config.externalSecret[0].data[0].remoteRef.key | string | `""` |  |
| external-secrets-config.externalSecret[0].data[0].remoteRef.property | string | `"kubeconfig"` |  |
| external-secrets-config.externalSecret[0].data[0].secretKey | string | `"kubeconfig"` |  |
| external-secrets-config.externalSecret[0].name | string | `"garden-co-golden"` |  |
| external-secrets-config.externalSecret[0].namespace | string | `"default"` |  |
| external-secrets-config.externalSecret[0].refreshInterval | string | `"15m"` |  |
| external-secrets-config.externalSecret[0].secretStore.name | string | `"hashicorp-vault"` |  |
| external-secrets-config.externalSecret[0].targetSecretName | string | `"garden-co-golden"` |  |
| external-secrets-config.secretStores[0].name | string | `"hashicorp-vault"` |  |
| external-secrets-config.secretStores[0].namespace | string | `"default"` |  |
| external-secrets-config.secretStores[0].provider.vault.auth.kubernetes.mountPath | string | `""` |  |
| external-secrets-config.secretStores[0].provider.vault.auth.kubernetes.role | string | `""` |  |
| external-secrets-config.secretStores[0].provider.vault.auth.kubernetes.secretRef.key | string | `"token"` |  |
| external-secrets-config.secretStores[0].provider.vault.auth.kubernetes.secretRef.name | string | `""` |  |
| external-secrets-config.secretStores[0].provider.vault.auth.kubernetes.secretRef.namespace | string | `"default"` |  |
| external-secrets-config.secretStores[0].provider.vault.namespace | string | `"ts-co-openmcp/mcp-blueprints"` |  |
| external-secrets-config.secretStores[0].provider.vault.path | string | `"mcps"` |  |
| external-secrets-config.secretStores[0].provider.vault.server | string | `""` |  |
| external-secrets-config.secretStores[0].provider.vault.version | string | `"v2"` |  |
| tags.crossplane-gardener-shoot-clusters | bool | `true` |  |
| tags.crossplane-provider-configs | bool | `true` |  |
| tags.crossplane-provider-helm | bool | `true` |  |
| tags.external-secrets-config | bool | `true` |  |

