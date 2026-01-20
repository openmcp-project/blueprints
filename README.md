[![REUSE status](https://api.reuse.software/badge/github.com/openmcp-project/blueprints)](https://api.reuse.software/info/github.com/openmcp-project/blueprints)

# blueprints

## About this project

This repository contains [umbrella helm charts](https://helm.sh/docs/howto/charts_tips_and_tricks/#complex-charts-with-many-dependencies) of the [Open Managed Control Plane (openMCP) Project](https://github.com/openmcp-project/) which are leveraging the Helm Charts of the [building blocks](https://github.com/openmcp-project/blueprint-building-blocks) to give **you** a big jump start in your [Infrastructure as Data]() Cloud Journey.

## Requirements and Setup

### Own repository
Create your own `openmcp-blueprints` Github Repository into your own Github Organisation by ["Use this Template"](https://github.com/new?owner=openmcp-project&template_name=blueprints&template_owner=openmcp-project) for. Make sure to provide following repository Secrets with your own identity token or technical user for your artifact repository:

| Repository Secret Name | Description                                                                                                                                                                                                                                                                                                                |
| --------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| HELM_REPO_USERNAME    | name of your own user or technical user |
| HELM_REPO_TOKEN       | own or technical user identity token    |

### Repository Configuration

Sadly Github does NOT copy repository settings, you have to set them initially by yourself! 
Do not disable or change Github Workflow `.github/workflows/git-pr-status-checks.yml` or following `main` branch protection! Otherwise, the described functionality and value-add cannot be guaranteed!

Additionally do NOT delete / rename `helm/charts/_templates_footer.gotmpl` and `helm/charts/_templates_header.gotmpl`! Otherwise, `README.md` generation will fail! Feel free to modify this files to your needs!

#### [Access Workflow](#github-access-workflow)
In order for your own Github Repository to access Github Workflow `.github/workflows/git-pr-status-checks.yml` on [openmcp-project/blueprint-workflows](https://github.com/openmcp-project/blueprint-workflows) you need to configure `Settings` -> `Actions` -> `General` -> the access of GitHub Actions workflows in other repositories to:

![Github Actions Workflows Access to other repositories](docs/static/github-actions-workflows-other-repos.png)

If this section is not available, please check with [GitHub Docs](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository#allowing-access-to-components-in-a-private-repository) and set visibility of your repository to `internal`. If 

#### Branch protection rule
| Field                                               | Value                              |
| --------------------------------------------------- | ---------------------------------- |
| Branch name pattern                                 | `main`                             |
| Require a pull request before merging               | :white_check_mark:                 |
| Require approvals                                   | :white_check_mark:                 |
| Require approval of the most recent reviewable push | :white_check_mark:                 |
| Require status checks to pass before merging        | :white_check_mark:                 |
| Require branches to be up-to-date before merging    | :white_check_mark:                 |
| Status checks that are required.                    | `Managed Control Plane Blueprints` |
| Require conversation resolution before merging      | :white_check_mark:                 |
| Do not allow bypassing the above settings           | :white_check_mark:                 |

### Umbrealla Helm Charts
All [Helm Charts](http://helm.sh) located at [`./helm/umbrella`](./helm/umbrella) are build to demonstrate orchestration of different SAP Cloud Resources. Please consult `README.md` file of each Umbrella Helm Chart to discover its purpose, `values.yaml` structure and intended purpose.

Feel free to browse existing [Umbrella Helm Chart Blueprints](helm/umbrella/blueprints) and pick one or multiple which covers most of the SAP Resources you want to orchestrate. Copy the templates into `./helm/umbrella/mcps/` to distinguish your own Helm Charts from the existing templates.

Add additional Sub Helm Charts from the [building blocks repository](https://github.com/openmcp-project/blueprint-building-blocks) and add/modify/delete `values.yaml` structure to orchestrate your desired landscape.

### Github PR
Open a Github PR into `main` in order to validate and template your Helm Charts via Github Workflow [`git-pr-status-checks.yml`](./.github/workflows/git-pr-status-checks.yml).

### K8s Manifest Generation
The Github Workflow [`git-pr-status-checks.yml`](./.github/workflows/git-pr-status-checks.yml) ensures that every Helm Chart:
1. templates valid k8s manifests
2. `.version` of `Chart.yaml` is bumped, in case there is a change
3. `README.md` is up-to-date
4. k8s manifest is templated, moved to `./manifests`, committed and pushed for every PR merging into `main`

!! Do not disable or change Github Workflow `.github/workflows/git-pr-status-checks.yml` or `main` branch protection!!

### GitOps
Set up a GitOps workflow by enabling the Flux component and configuring it to sync with your Git repository. Use the provided Helm charts to manage credentials and configurations for tools like External Secrets Operator.

Please use Helm Chart [flux-config](https://github.com/openmcp-project/blueprint-building-blocks/tree/main/helm/charts/mcp/flux-config) to enable GitOps on your own OpenMCP and sync the corresponding `./manifests/..` folder.


## Clean UP
Be aware, that you need to **delete** / **deactivate** your Umbrella Helm Chart Dependencies in a certain order for deletion **NOT** get **STUCK**!! More details [here](https://github.com/openmcp-project/blueprint-building-blocks#helm-chart-dependencies-deletion-dependency-graph).

## FAQ

### Q: Repository Folder Structure
Do i need to follow a certain folder structure?
**A**: No! You can put your Helm Chart wherever you want. It's highly recommended following the open source community best practices:

| Folder          | Purpose                                                                                                                                                                                              |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ./helm/charts   | Contains only (Sub) Helm Charts with `chart-abc/templates/*.yaml/yml` files.                                                                                                                         |
| ./helm/umbrella | Contains only (Umbrella) Helm Charts which reference to a dependent (Sub) Helm Chart within `Chart.yaml`. Typhically Umbrella Helm Charts do not contain any `chart-abc/templates/*.yaml/yml` files. |
| ./manifests     | This folder contains all the templated Helm Charts and can **NOT** be changed!                                                                                                                       |

### Q: Disable k8s manifest generation
How to disable k8s manifest generation?

**A**: Create / Update `chart-abc/.ci.config.yaml` with the following content:

```yaml
move-manifests.sh:
  enabled: false
```

With the next run of Github Action `.github/workflows/git-pr-status-checks.yml` the `./manifest/...` folder of `chart-abc` should be removed!

### Q: Local Chart Dependency
I am missing k8s manifest `xyz`. How can I include it into `k8s manifest generation`?

**A**: There is no need, to re-use CO [MCP Blueprint Building Blocks](https://github.com/openmcp-project/blueprint-building-blocks) Helm Charts! 
Feel free to create your own custom (Sub) Helm Charts at `helm/charts` and declare it as Dependency in an Umbrella Helm Chart at `helm/umbrella`.

| Helm Chart                                                                                    | Purpose                                                                                                                                                                                                                                                                                                                                |
| --------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| (Sub) [Custom Chart](./helm/charts/custom-chart)                                                                | Custom (Sub) Helm Chart containing k8s manifests which are not covered by CO [MCP Blueprint Building Blocks](https://github.com/openmcp-project/blueprint-building-blocks) or not to your liking.                                                                                                                            |
| (Umbrella) [Custom Chart](./helm/umbrella/blueprints/include-custom-helm-charts.abc.shoot.live.k8s-hana.ondemand.com) | Umbrella Helm Chart which references to local (Sub) Helm Chart `helm/charts/custom-chart` and re-uses additionally CO [MCP Blueprint Building Blocks](https://github.com/openmcp-project/blueprint-building-blocks). Of course, `k8s manifest generation` for `./manifests/..` also works without any external Dependencies. |


### Q: GH Workflow - `workflow git-pr-status-checks.yml was not found`
```bash
Invalid workflow file: .github/workflows/git-pr-status-checks.yml#L12 
error parsing called workflow ".github/workflows/git-pr-status-checks.yml"
-> "cloud-orchestration/mcp-blueprint-building-blocks/.github/workflows/git-pr-status-checks.yml@main"
: workflow was not found. See https://docs.github.com/en/actions/sharing-automations/reusing-workflows#access-to-reusable-workflows for more information.
```

**A**: See [Access Workflow](#github-access-workflow) and [Github Docs](https://docs.github.com/en/actions/sharing-automations/reusing-workflows#access-to-reusable-workflows)

### Q: Helm Chart Files - Why `.ci.config.yaml`?

**A**: See [in-depth documentation](https://github.com/openmcp-project/blueprint-building-blocks#github-workflow-ci-config-yaml)

### Q: Helm Chart Dependency Build `can't get a valid version`
Github Workflow `cloud-orchestration/mcp-blueprint-building-blocks/.github/actions/helm-chart-dep-build@main` is failing with 

```bash
$ helm dependency update ./helm/umbrella/dev
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "cloud-orchestrator-mcp-blueprint-building-blocks" chart repository
Update Complete. ⎈Happy Helming!⎈
Error: can't get a valid version for repositories crossplane-provider-configurations. Try changing the version constraint in Chart.yaml
======== ERROR STOPPING EXECUTION =======
```

**A**: Check if all `dependencies[].version` of `/helm/umbrella/dev/Chart.yaml` are existing! Versions are expected to follow [Semantic Versioning](https://semver.org/) and [ranges](https://devhints.io/semver) can be defined e.g. `version: ">1.2.1"`. Semantic Versioning ranges are **NOT** recommended because a Helm Chart Dependency upgrade to a new `version` should always be a conscious action!

### Q: Compare Helm Chart Versions How?
How can I compare what has changed of [`crossplane-provider-aws-ec2`](https://github.com/openmcp-project/blueprint-building-blocks/tree/main/helm/charts/mcp/crossplane-provider-aws-ec2) from Helm Chart Version `0.0.1` to `0.0.2`?

**A**: For every Helm Chart `version` change of every [`mcp-blueprint-building-blocks`](https://github.com/openmcp-project/blueprint-building-blocks) Helm Chart, there is a Git Tag created. 

You can either use Github Functionality of [comparing commits/tags](https://docs.github.com/en/pull-requests/committing-changes-to-your-project/viewing-and-comparing-commits/comparing-commits) (e.g. [crossplane-provider-aws-ec2/0.0.1 <-> crossplane-provider-aws-ec2/0.0.2](https://github.com/openmcp-project/blueprint-building-blocks/compare/crossplane-provider-aws-ec2/0.0.1...crossplane-provider-aws-ec2/0.0.2)) or use [`git diff`](https://git-scm.com/docs/git-diff) to compare certain folder or files.

```bash
git diff "crossplane-provider-aws-ec2/0.0.1" "crossplane-provider-aws-ec2/0.0.2" -- helm/charts/mcp/crossplane-provider-aws-ec2
```

## Support, Feedback, Contributing

This project is open to feature requests/suggestions, bug reports etc. via [GitHub issues](https://github.com/openmcp-project/blueprints/issues) and maintained on a best effort basis. Contribution and feedback are encouraged and always welcome. For more information about how to contribute, the project structure, as well as additional contribution information, see our [Contribution Guidelines](CONTRIBUTING.md).

## Security / Disclosure
If you find any bug that may be a security problem, please follow our instructions at [in our security policy](https://github.com/openmcp-project/blueprints/security/policy) on how to report it. Please do not create GitHub issues for security-related doubts or problems.

## Code of Conduct

We as members, contributors, and leaders pledge to make participation in our community a harassment-free experience for everyone. By participating in this project, you agree to abide by its [Code of Conduct](https://github.com/SAP/.github/blob/main/CODE_OF_CONDUCT.md) at all times.

## Licensing

Copyright 2025 SAP SE or an SAP affiliate company and blueprints contributors. Please see our [LICENSE](LICENSE) for copyright and license information. Detailed information including third-party components and their licensing/copyright information is available [via the REUSE tool](https://api.reuse.software/info/github.com/openmcp-project/blueprints).
