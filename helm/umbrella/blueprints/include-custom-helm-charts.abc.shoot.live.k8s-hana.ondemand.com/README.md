

# include-custom-helm-charts

![Version: 0.0.16](https://img.shields.io/badge/Version-0.0.16-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Umbrealla Helm chart which demonstrate on how to include local Helm Charts within the same Git Repository.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../../../charts/custom-chart | custom-chart(custom-chart) | ~0.x.x |
| oci://ghcr.io/openmcp-project | crossplane-provider-configs(crossplane-provider-configs) | 0.0.19 |
| oci://ghcr.io/openmcp-project | external-secrets-config(external-secrets-config) | 0.1.10 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].cisCredentials.secretRef.key | string | `"btp-cis-provider-credentials"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].cisCredentials.secretRef.name | string | `"btp-account-mcp-blueprints"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].cisCredentials.secretRef.namespace | string | `"default"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].cisCredentials.source | string | `"Secret"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].cliServerUrl | string | `"https://cli.btp.cloud.sap"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].globalAccountSubDomain | string | `"globalAccountSubDomain"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].providerConfigRefName | string | `"provider-config-ref-name-btp-account-mcp-blueprints"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].serviceAccountSecret.secretRef.key | string | `"btp-service-account-provider-credentials"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].serviceAccountSecret.secretRef.name | string | `"btp-account-mcp-blueprints"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].serviceAccountSecret.secretRef.namespace | string | `"default"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].serviceAccountSecret.source | string | `"Secret"` |  |
| custom-chart.image.pullPolicy | string | `"Always"` |  |
| custom-chart.image.repository | string | `"nginx"` |  |
| custom-chart.replicaCount | int | `2` |  |
| custom-chart.serviceAccount.create | bool | `false` |  |
| external-secrets-config.externalSecret[0].data[0].remoteRef.key | string | `"btp-endpoint.example/btp-account"` |  |
| external-secrets-config.externalSecret[0].data[0].remoteRef.property | string | `"btp-cis-provider-credentials"` |  |
| external-secrets-config.externalSecret[0].data[0].secretKey | string | `"btp-cis-provider-credentials"` |  |
| external-secrets-config.externalSecret[0].data[1].remoteRef.key | string | `"btp-endpoint.example/btp-account"` |  |
| external-secrets-config.externalSecret[0].data[1].remoteRef.property | string | `"btp-service-account-provider-credentials"` |  |
| external-secrets-config.externalSecret[0].data[1].secretKey | string | `"btp-service-account-provider-credentials"` |  |
| external-secrets-config.externalSecret[0].name | string | `"btp-account-mcp-blueprints"` |  |
| external-secrets-config.externalSecret[0].namespace | string | `"default"` |  |
| external-secrets-config.externalSecret[0].refreshInterval | string | `"15m"` |  |
| external-secrets-config.externalSecret[0].secretStore.name | string | `"hashicorp-vault"` |  |
| external-secrets-config.externalSecret[0].targetSecretName | string | `"btp-account-mcp-blueprints"` |  |
| external-secrets-config.secretStores[0].name | string | `"hashicorp-vault"` |  |
| external-secrets-config.secretStores[0].namespace | string | `"default"` |  |
| external-secrets-config.secretStores[0].provider.vault.auth.kubernetes.mountPath | string | `"kubernetes"` |  |
| external-secrets-config.secretStores[0].provider.vault.auth.kubernetes.role | string | `"mcp-blueprints"` |  |
| external-secrets-config.secretStores[0].provider.vault.auth.kubernetes.secretRef.key | string | `"token"` |  |
| external-secrets-config.secretStores[0].provider.vault.auth.kubernetes.secretRef.name | string | `"vault-token-sa"` |  |
| external-secrets-config.secretStores[0].provider.vault.auth.kubernetes.secretRef.namespace | string | `"default"` |  |
| external-secrets-config.secretStores[0].provider.vault.namespace | string | `"ns1"` |  |
| external-secrets-config.secretStores[0].provider.vault.path | string | `"k8s-clusters"` |  |
| external-secrets-config.secretStores[0].provider.vault.server | string | `"https://vault.example/"` |  |
| external-secrets-config.secretStores[0].provider.vault.version | string | `"v2"` |  |
| tags.crossplane-provider-configs | bool | `true` |  |
| tags.custom-chart | bool | `true` |  |
| tags.external-secrets-config | bool | `true` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)