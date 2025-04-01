# renovate-bot-helm-chart-release-notes-test

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Umbrealla Helm chart which tests Renovate Bot Helm Chart Release Notes.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
|  https://raw.githubusercontent.com/openmcp-project/blueprint-building-blocks/gh-pages/ | test-custom-chart(test-custom-chart) | 0.0.5 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| custom-chart.image.pullPolicy | string | `"Always"` |  |
| custom-chart.image.repository | string | `"nginx"` |  |
| custom-chart.replicaCount | int | `2` |  |
| custom-chart.serviceAccount.create | bool | `false` |  |
| tags.test-custom-chart | bool | `true` |  |

