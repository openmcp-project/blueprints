import externalsecretsconfig
import externalsecretsconfig.schema as asda

config = asda.ExternalSecretsConfig {
    externalSecret = [{
        name = "KCL-btp-account-mcp-blueprints"
        namespace = "default"
        labels = {
            "openmcp.cloud/blueprint-building-block" = "external-secrets-config"
            "openmcp.cloud/blueprint-building-block-version" = "0.1.10"
        }
        refreshInterval = "15m"
        secretStore = {
            name = "hashicorp-vault"
        }
        target = {
            name = "btp-account-mcp-blueprints"
        }
        data = [
            {
                remoteRef = {
                    key = "btp-endpoint.example/btp-account"
                    property = "btp-cis-provider-credentials"
                }
                secretKey = "btp-cis-provider-credentials"
            },
            {
                remoteRef = {
                    key = "btp-endpoint.example/btp-account"
                    property = "btp-service-account-provider-credentials"
                }
                secretKey = "btp-service-account-provider-credentials"
            }
        ]
    }]
    secretStores = [{
        name: "KCL-hashicorp-vault"
        namespace = "default"
        labels = {
            "openmcp.cloud/blueprint-building-block" = "external-secrets-config"
            "openmcp.cloud/blueprint-building-block-version" = "0.1.10"
        }
        provider = {
            vault = {
                auth = {
                    kubernetes = {
                        mountPath = "kubernetes"
                        role = "mcp-blueprints"
                        secretRef = {
                            key = "token"
                            name = "vault-token-sa"
                            namespace = "default"
                        }
                    }
                }
                namespace = "ns1"
                path = "k8s-clusters"
                server = "https://vault.example/"
                version = "v2"
            }
        }
    }]
}