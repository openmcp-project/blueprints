

# btp-cf-env-runtime

![Version: 0.0.27](https://img.shields.io/badge/Version-0.0.27-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Umbrealla Helm chart which demonstrate orchestration of SAP BTP Cloud Foundry Environment.

## Source Code

* <https://github.com/openmcp-project/blueprints>
* <https://github.com/openmcp-project/blueprint-building-blocks>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://ghcr.io/openmcp-project | crossplane-provider-configs(crossplane-provider-configs) | 0.0.19 |
| oci://ghcr.io/openmcp-project | crossplane-provider-sap-btp-account(crossplane-provider-sap-btp-account) | 0.0.9 |
| oci://ghcr.io/openmcp-project | crossplane-provider-sap-btp-environment(crossplane-provider-sap-btp-environment) | 0.0.15 |
| oci://ghcr.io/openmcp-project | external-secrets-config(external-secrets-config) | 0.1.10 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].cisCredentials.secretRef.key | string | `"btp-cis-provider-credentials"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].cisCredentials.secretRef.name | string | `"btp-account-mcp-blueprints"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].cisCredentials.secretRef.namespace | string | `"default"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].cisCredentials.source | string | `"Secret"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].cliServerUrl | string | `"https://cli.btp.cloud.sap"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].globalAccountSubDomain | string | `"exmpl"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].providerConfigRefName | string | `"btp-account-provider-config"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].serviceAccountSecret.secretRef.key | string | `"btp-service-account-provider-credentials"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].serviceAccountSecret.secretRef.name | string | `"btp-account-mcp-blueprints"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].serviceAccountSecret.secretRef.namespace | string | `"default"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].serviceAccountSecret.source | string | `"Secret"` |  |
| crossplane-provider-sap-btp-account.accounts[0].btpSapCrossplaneProviderConfigRefName | string | `"btp-account-provider-config"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].entitlements[0].amount | int | `1` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].entitlements[0].name | string | `"cis-local"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].entitlements[0].permitNumericQuota | bool | `false` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].entitlements[0].serviceName | string | `"cis"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].entitlements[0].servicePlanName | string | `"local"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].forProvider.description | string | `"Open Orchestrator Managed Control Plane Blueprint PoC"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].forProvider.displayName | string | `"exmpl dev eu01"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].forProvider.region | string | `"eu01"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].forProvider.subaccountAdminEmails | list | `[]` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].forProvider.subdomain | string | `"exmpl-dev-eu01"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].name | string | `"subAccount1"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].services.cloudManagement | bool | `true` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].services.serviceManager | bool | `true` |  |
| crossplane-provider-sap-btp-account.btpEntitlements[0].amount | int | `1` |  |
| crossplane-provider-sap-btp-account.btpEntitlements[0].name | string | `"cis-local"` |  |
| crossplane-provider-sap-btp-account.btpEntitlements[0].permitNumericQuota | bool | `false` |  |
| crossplane-provider-sap-btp-account.btpEntitlements[0].serviceName | string | `"cis"` |  |
| crossplane-provider-sap-btp-account.btpEntitlements[0].servicePlanName | string | `"local"` |  |
| crossplane-provider-sap-btp-account.cfAdminEmails | list | `[]` |  |
| crossplane-provider-sap-btp-account.subaccountAdminEmails | list | `[]` |  |
| crossplane-provider-sap-btp-environment.cloudFoundryEnvironments[0].btpSapCrossplaneProviderConfigRefName | string | `"btp-account-provider-config"` |  |
| crossplane-provider-sap-btp-environment.cloudFoundryEnvironments[0].cloudManagementRef.name | string | `"dev-eu01"` |  |
| crossplane-provider-sap-btp-environment.cloudFoundryEnvironments[0].forProvider.initialOrgManagers | list | `[]` |  |
| crossplane-provider-sap-btp-environment.cloudFoundryEnvironments[0].forProvider.landscape | string | `"eu01"` |  |
| crossplane-provider-sap-btp-environment.cloudFoundryEnvironments[0].name | string | `"test"` |  |
| crossplane-provider-sap-btp-environment.cloudFoundryEnvironments[0].subaccountRef.name | string | `"dev-eu01"` |  |
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
| external-secrets-config.externalSecret[0].targetSecretName | string | `"btp-account-credentials"` |  |
| external-secrets-config.secretStores[0].name | string | `"hashicorp-vault"` |  |
| external-secrets-config.secretStores[0].namespace | string | `"default"` |  |
| external-secrets-config.secretStores[0].provider.vault.auth.kubernetes.mountPath | string | `"k8s-openmcp-blueprints"` |  |
| external-secrets-config.secretStores[0].provider.vault.auth.kubernetes.role | string | `"k8s-openmcp-role"` |  |
| external-secrets-config.secretStores[0].provider.vault.auth.kubernetes.secretRef.key | string | `"token"` |  |
| external-secrets-config.secretStores[0].provider.vault.auth.kubernetes.secretRef.name | string | `"vault-tokenreview-service-account"` |  |
| external-secrets-config.secretStores[0].provider.vault.auth.kubernetes.secretRef.namespace | string | `"default"` |  |
| external-secrets-config.secretStores[0].provider.vault.namespace | string | `"openmcp/blueprints"` |  |
| external-secrets-config.secretStores[0].provider.vault.path | string | `"mcps"` |  |
| external-secrets-config.secretStores[0].provider.vault.server | string | `"https://vault.example/"` |  |
| external-secrets-config.secretStores[0].provider.vault.version | string | `"v2"` |  |
| tags.crossplane-provider-configs | bool | `true` |  |
| tags.crossplane-provider-sap-btp-account | bool | `true` |  |
| tags.crossplane-provider-sap-btp-environment | bool | `true` |  |
| tags.external-secrets-config | bool | `true` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)