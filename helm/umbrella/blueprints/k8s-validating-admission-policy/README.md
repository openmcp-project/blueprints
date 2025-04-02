# k8s-validating-admission-policy

![Version: 0.0.2](https://img.shields.io/badge/Version-0.0.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Umbrealla Helm chart which contains k8s ValidatingAdmissionPolicy & ValidatingAdmissionPolicyBinding for a couple of crossplane ProviderConfig. As of Nov 2024, mcp admins do not have permission to manage kind ValidatingAdmissionPolicy, therefore this solution can only be applied to self hosted crossplane k8s clusters!

## Requirements

| Repository | Name | Version |
|------------|------|---------|
|  oci://ghcr.io/openmcp-project | k8s-validating-admission-policy(k8s-validating-admission-policy) | 0.0.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| k8s-validating-admission-policy.validatingAdmissionPolicies[0].name | string | `"crossplane-helm-provider-config-if-secret-exists"` |  |
| k8s-validating-admission-policy.validatingAdmissionPolicies[0].spec.failurePolicy | string | `"Fail"` |  |
| k8s-validating-admission-policy.validatingAdmissionPolicies[0].spec.matchConstraints.resourceRules[0].apiGroups[0] | string | `""` |  |
| k8s-validating-admission-policy.validatingAdmissionPolicies[0].spec.matchConstraints.resourceRules[0].apiVersions[0] | string | `"v1"` |  |
| k8s-validating-admission-policy.validatingAdmissionPolicies[0].spec.matchConstraints.resourceRules[0].operations[0] | string | `"DELETE"` |  |
| k8s-validating-admission-policy.validatingAdmissionPolicies[0].spec.matchConstraints.resourceRules[0].resources[0] | string | `"secrets"` |  |
| k8s-validating-admission-policy.validatingAdmissionPolicies[0].spec.paramKind.apiVersion | string | `"helm.crossplane.io/v1beta1"` |  |
| k8s-validating-admission-policy.validatingAdmissionPolicies[0].spec.paramKind.kind | string | `"ProviderConfig"` |  |
| k8s-validating-admission-policy.validatingAdmissionPolicies[0].spec.validations[0].expression | string | `"( \nhas(params.spec) && \nhas(params.spec.credentials) && \nhas(params.spec.credentials.secretRef) && \nhas(params.spec.credentials.secretRef.name) && \noldObject.metadata.name != params.spec.credentials.secretRef.name &&\noldObject.metadata.namespace != params.spec.credentials.secretRef.namespace\n)\n"` |  |
| k8s-validating-admission-policy.validatingAdmissionPolicies[0].spec.validations[0].messageExpression | string | `"'Secret %s cannot be deleted because its referenced in Kind:%s (%s) %s'.format([oldObject.metadata.name,params.kind,params.apiVersion,params.metadata.name])"` |  |
| k8s-validating-admission-policy.validatingAdmissionPolicies[0].spec.validations[0].reason | string | `"Invalid"` |  |
| k8s-validating-admission-policy.validatingAdmissionPolicyBindings[0].name | string | `"crossplane-helm-provider-config-secret-binding"` |  |
| k8s-validating-admission-policy.validatingAdmissionPolicyBindings[0].spec.paramRef.parameterNotFoundAction | string | `"Allow"` |  |
| k8s-validating-admission-policy.validatingAdmissionPolicyBindings[0].spec.paramRef.selector | object | `{}` |  |
| k8s-validating-admission-policy.validatingAdmissionPolicyBindings[0].spec.policyName | string | `"crossplane-helm-provider-config-if-secret-exists"` |  |
| k8s-validating-admission-policy.validatingAdmissionPolicyBindings[0].spec.validationActions[0] | string | `"Deny"` |  |
| matchConstraints.resourceRules[0].apiGroups[0] | string | `""` |  |
| matchConstraints.resourceRules[0].apiVersions[0] | string | `"v1"` |  |
| matchConstraints.resourceRules[0].operations[0] | string | `"DELETE"` |  |
| matchConstraints.resourceRules[0].resources[0] | string | `"secrets"` |  |
| paramRef.parameterNotFoundAction | string | `"Allow"` |  |
| paramRef.selector | object | `{}` |  |
| tags.k8s-validating-admission-policy | bool | `true` |  |
| validations[0].expression | string | `"( \nhas(params.spec) && \nhas(params.spec.credentials) && \nhas(params.spec.credentials.secretRef) && \nhas(params.spec.credentials.secretRef.name) && \noldObject.metadata.name != params.spec.credentials.secretRef.name &&\noldObject.metadata.namespace != params.spec.credentials.secretRef.namespace\n)\n"` |  |
| validations[0].messageExpression | string | `"'Secret %s cannot be deleted because its referenced in Kind:%s (%s) %s'.format([oldObject.metadata.name,params.kind,params.apiVersion,params.metadata.name])"` |  |
| validations[0].reason | string | `"Invalid"` |  |

