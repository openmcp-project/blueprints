# TL;DR
This template umbrella Helm Chart demonstrates the orchestration of BTP resources such as [BTP Sub Accounts](https://learning.sap.com/learning-journeys/introducing-cloud-security-on-sap-business-technology-platform/using-global-accounts-and-subaccounts_fc42dbb5-5c5b-4903-a3f6-fed3d7f5ee22) and [BTP Entitlements](https://help.sap.com/docs/btp/sap-business-technology-platform/managing-entitlements-and-quotas-using-cockpit?locale=322080db84734e9b8812ede13703b83c.html).

# migration-test-provider-btp-accounts

![Version: 0.0.16](https://img.shields.io/badge/Version-0.0.16-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Umbrealla Helm chart which contains crossplane manifests to demonstrate orchestration of SAP BTP Accounts

## Requirements

| Repository | Name | Version |
|------------|------|---------|
|  oci://ghcr.io/openmcp-project | crossplane-provider-configs(crossplane-provider-configs) | 0.0.15 |
|  oci://ghcr.io/openmcp-project | crossplane-provider-sap-btp-account(crossplane-provider-sap-btp-account) | 0.0.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].cisCredentials.secretRef.key | string | `"data"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].cisCredentials.secretRef.name | string | `"cis-provider-secret"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].cisCredentials.secretRef.namespace | string | `"default"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].cisCredentials.source | string | `"Secret"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].cliServerUrl | string | `"https://cli.btp.cloud.sap"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].globalAccountSubDomain | string | `"b81eca48-daa3-4515-951c-f499da5d64d5"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].providerConfigRefName | string | `"btp-account-mcp-blueprints"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].serviceAccountSecret.secretRef.key | string | `"credentials"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].serviceAccountSecret.secretRef.name | string | `"sa-provider-secret"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].serviceAccountSecret.secretRef.namespace | string | `"default"` |  |
| crossplane-provider-configs.providerConfigs.btpSapCrossplane[0].serviceAccountSecret.source | string | `"Secret"` |  |
| crossplane-provider-sap-btp-account.accounts[0].accountBtpOrchestrateCloudProviderConfigRefName | string | `"btp-account-mcp-blueprints"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].entitlements[0].name | string | `"auditlog-viewer"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].entitlements[0].permitNumericQuota | bool | `false` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].entitlements[0].serviceName | string | `"auditlog-viewer"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].entitlements[0].servicePlanName | string | `"free"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].entitlements[1].name | string | `"cis-local"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].entitlements[1].permitNumericQuota | bool | `false` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].entitlements[1].serviceName | string | `"cis"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].entitlements[1].servicePlanName | string | `"local"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].forProvider.description | string | `"Sub Account managed by MCP & IaD from MCP #2"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].forProvider.displayName | string | `"MCP #1 Blueprint Sub-Account #1"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].forProvider.region | string | `""` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].forProvider.subaccountAdmins | list | `[]` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].forProvider.subdomain | string | `"blueprint-test-1"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].name | string | `"subAccount1"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].services.cloudManagement | bool | `true` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].services.serviceManager | bool | `true` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].subscriptions[0].appName | string | `"auditlog-viewer"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].subscriptions[0].name | string | `"auditlog-viewer"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].subscriptions[0].planName | string | `"free"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].subscriptions[0].writeConnectionSecretToRef.name | string | `"auditlog-viewer"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[0].subscriptions[0].writeConnectionSecretToRef.namespace | string | `"default"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[1].forProvider.description | string | `"Sub Account managed by MCP & IaD from MCP #2 new"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[1].forProvider.displayName | string | `"MCP #1 Blueprint Sub-Account #2"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[1].forProvider.region | string | `""` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[1].forProvider.subaccountAdmins | list | `[]` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[1].forProvider.subdomain | string | `"blueprint-test-2"` |  |
| crossplane-provider-sap-btp-account.accounts[0].subAccounts[1].name | string | `"subAccount2"` |  |
| crossplane-provider-sap-btp-account.entitlementsLegacyLandscape[0].name | string | `"auditlog-viewer"` |  |
| crossplane-provider-sap-btp-account.entitlementsLegacyLandscape[0].permitNumericQuota | bool | `false` |  |
| crossplane-provider-sap-btp-account.entitlementsLegacyLandscape[0].serviceName | string | `"auditlog-viewer"` |  |
| crossplane-provider-sap-btp-account.entitlementsLegacyLandscape[0].servicePlanName | string | `"free"` |  |
| crossplane-provider-sap-btp-account.entitlementsLegacyLandscape[1].name | string | `"cis-local"` |  |
| crossplane-provider-sap-btp-account.entitlementsLegacyLandscape[1].permitNumericQuota | bool | `false` |  |
| crossplane-provider-sap-btp-account.entitlementsLegacyLandscape[1].serviceName | string | `"cis"` |  |
| crossplane-provider-sap-btp-account.entitlementsLegacyLandscape[1].servicePlanName | string | `"local"` |  |
| crossplane-provider-sap-btp-account.subaccountAdminEmails | list | `[]` |  |
| tags.crossplane-provider-configs | bool | `true` |  |
| tags.crossplane-provider-sap-btp-account | bool | `true` |  |

