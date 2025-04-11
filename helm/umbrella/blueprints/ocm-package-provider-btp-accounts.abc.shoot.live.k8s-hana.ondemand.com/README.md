

# ocm-package-provider-btp-accounts

![Version: 0.0.8](https://img.shields.io/badge/Version-0.0.8-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Umbrealla Helm chart which contains crossplane manifests to demonstrate orchestration of SAP BTP Accounts within a OCM package

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://ghcr.io/openmcp-project | crossplane-provider-configs(crossplane-provider-configs) | 0.0.15 |
| oci://ghcr.io/openmcp-project | crossplane-provider-pkgs(crossplane-provider-pkgs) | 0.0.10 |
| oci://ghcr.io/openmcp-project | crossplane-provider-sap-btp-account(crossplane-provider-sap-btp-account) | 0.0.6 |
| oci://ghcr.io/openmcp-project | external-secrets-config(external-secrets-config) | 0.1.7 |
# TL;DR
This template umbrella Helm Chart demonstrates the orchestration of BTP resources such as [BTP Sub Accounts](https://learning.sap.com/learning-journeys/introducing-cloud-security-on-sap-business-technology-platform/using-global-accounts-and-subaccounts_fc42dbb5-5c5b-4903-a3f6-fed3d7f5ee22) and [BTP Entitlements](https://help.sap.com/docs/btp/sap-business-technology-platform/managing-entitlements-and-quotas-using-cockpit?locale=322080db84734e9b8812ede13703b83c.html) within a [OCM](https://ocm.software) package.

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
| crossplane-provider-pkgs.providers[0].name | string | `"provider-ias"` |  |
| crossplane-provider-pkgs.providers[0].spec.package | string | `"ocm/crossplane/provider-ias:0.2.2"` |  |
| crossplane-provider-pkgs.providers[0].spec.packagePullPolicy | string | `"IfNotPresent"` |  |
| crossplane-provider-pkgs.providers[0].spec.packagePullSecrets[0].name | string | `"pull-secret"` |  |
| crossplane-provider-pkgs.providers[1].name | string | `"provider-gardener-auth"` |  |
| crossplane-provider-pkgs.providers[1].spec.package | string | `"ocm/crossplane/provider-gardener-auth:0.0.4"` |  |
| crossplane-provider-pkgs.providers[1].spec.packagePullPolicy | string | `"IfNotPresent"` |  |
| crossplane-provider-pkgs.providers[1].spec.packagePullSecrets[0].name | string | `"pull-secret"` |  |
| crossplane-provider-pkgs.providers[2].name | string | `"provider-kubernetes"` |  |
| crossplane-provider-pkgs.providers[2].spec.package | string | `"xpkg.upbound.io/crossplane-contrib/provider-kubernetes:v0.15.0"` |  |
| crossplane-provider-pkgs.providers[2].spec.packagePullPolicy | string | `"IfNotPresent"` |  |
| crossplane-provider-pkgs.providers[2].spec.packagePullSecrets[0].name | string | `"pull-secret"` |  |
| crossplane-provider-pkgs.providers[3].name | string | `"provider-helm"` |  |
| crossplane-provider-pkgs.providers[3].spec.package | string | `"xpkg.upbound.io/crossplane-contrib/provider-helm:v0.19.0"` |  |
| crossplane-provider-pkgs.providers[3].spec.packagePullPolicy | string | `"IfNotPresent"` |  |
| crossplane-provider-pkgs.providers[3].spec.packagePullSecrets[0].name | string | `"pull-secret"` |  |
| crossplane-provider-pkgs.providers[4].name | string | `"provider-btp"` |  |
| crossplane-provider-pkgs.providers[4].spec.package | string | `"ghcr.io/sap/crossplane-provider-btp/crossplane/provider-btp:v1.0.2"` |  |
| crossplane-provider-pkgs.providers[4].spec.packagePullPolicy | string | `"IfNotPresent"` |  |
| crossplane-provider-pkgs.providers[4].spec.packagePullSecrets[0].name | string | `"pull-secret"` |  |
| crossplane-provider-sap-btp-account.accounts[0].btpSapCrossplaneProviderConfigRefName | string | `"provider-config-ref-name-btp-account-mcp-blueprints"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].entitlements[0].amount | int | `1` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].entitlements[0].name | string | `"auditlog-oauth2"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].entitlements[0].permitNumericQuota | bool | `true` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].entitlements[0].serviceName | string | `"auditlog-management"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].entitlements[0].servicePlanName | string | `"default"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].forProvider.description | string | `"Sub Account managed by CO MCP & IaD"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].forProvider.displayName | string | `"CO Managed Control Plane Blueprint Sub-Account"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].forProvider.region | string | `""` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].forProvider.subaccountAdminEmails | list | `[]` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].forProvider.subdomain | string | `"mcp-blueprint-test-1"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].name | string | `"subAccount1"` |  |
| crossplane-provider-sap-btp-account.entitlementsLegacyLandscape[0].amount | int | `1` |  |
| crossplane-provider-sap-btp-account.entitlementsLegacyLandscape[0].name | string | `"auditlog-oauth2"` |  |
| crossplane-provider-sap-btp-account.entitlementsLegacyLandscape[0].permitNumericQuota | bool | `true` |  |
| crossplane-provider-sap-btp-account.entitlementsLegacyLandscape[0].serviceName | string | `"auditlog-management"` |  |
| crossplane-provider-sap-btp-account.entitlementsLegacyLandscape[0].servicePlanName | string | `"default"` |  |
| crossplane-provider-sap-btp-account.subaccountAdminEmails | list | `[]` |  |
| external-secrets-config.externalSecret[0].data[0].remoteRef.key | string | `""` |  |
| external-secrets-config.externalSecret[0].data[0].remoteRef.property | string | `"btp-cis-provider-credentials"` |  |
| external-secrets-config.externalSecret[0].data[0].secretKey | string | `"btp-cis-provider-credentials"` |  |
| external-secrets-config.externalSecret[0].data[1].remoteRef.key | string | `""` |  |
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
| external-secrets-config.secretStores[0].provider.vault.auth.kubernetes.secretRef.name | string | `""` |  |
| external-secrets-config.secretStores[0].provider.vault.auth.kubernetes.secretRef.namespace | string | `"default"` |  |
| external-secrets-config.secretStores[0].provider.vault.namespace | string | `""` |  |
| external-secrets-config.secretStores[0].provider.vault.path | string | `"k8s-clusters"` |  |
| external-secrets-config.secretStores[0].provider.vault.server | string | `"vault.example"` |  |
| external-secrets-config.secretStores[0].provider.vault.version | string | `"v2"` |  |
| tags.crossplane-provider-configs | bool | `true` |  |
| tags.crossplane-provider-pkgs | bool | `true` |  |
| tags.crossplane-provider-sap-btp-account | bool | `true` |  |
| tags.external-secrets-config | bool | `false` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)