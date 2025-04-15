
# Image URL to use all building/pushing image targets
#IMG_VERSION ?= dev

SET_BASE_DIR := $(eval BASE_DIR=$(shell git rev-parse --show-toplevel))

# Setting SHELL to bash allows bash commands to be executed by recipes.
# Options are set to exit when a recipe line exits non-zero or a piped command fails.
SHELL = /usr/bin/env bash -o pipefail
.SHELLFLAGS = -ec


.PHONY: helm-docs
helm-docs: export BASH_SCRIPT = helm-docs.sh
helm-docs: helm-chart-listing
	
	$(PWD)/.github/actions/helm-docs/helm-docs.sh

.PHONY: helm-chart-listing
helm-chart-listing: 
	$(PWD)/.github/actions/helm-chart-listing/helm-chart-listing.sh

.PHONY: helm-dep-build
helm-dep-build:
	$(PWD)/.github/actions/helm-chart-dep-build/helm-dep-build.sh

.PHONY: helm-chart-linting-manifest-validation
helm-chart-linting-manifest-validation: export BASH_SCRIPT = helm-chart-linting-manifest-validation.sh
helm-chart-linting-manifest-validation: clean helm-chart-listing helm-dep-build helm-chart-linting-manifest-validation-run
helm-chart-linting-manifest-validation-run: 
	$(PWD)/.github/actions/helm-chart-linting-manifest-validation/helm-chart-linting-manifest-validation.sh

.PHONY: manifests
manifests: export BASH_SCRIPT = move-manifests.sh
manifests: clean helm-chart-listing helm-dep-build helm-chart-linting-manifest-validation-run
	$(PWD)/.github/actions/move-manifests/move-manifests.sh

.PHONY: helm-chart-version-bump
helm-chart-version-bump: export BASH_SCRIPT = helm-chart-version-bump.sh
helm-chart-version-bump: 
	$(PWD)/.github/actions/helm-chart-version-bump/helm-chart-version-bump.sh

.PHONY: shell-check
shell-check: 
	$(PWD)/scripts/ci/shellcheck.sh

.PHONY: clean
clean: 
	rm -rf helm-template-*.yaml
	rm -rf pr-status-check-*.txt
	rm -rf helm-charts-*.yaml
	rm -rf modified_files.txt
	rm -rf helm-packages

.PHONY: release-to-jfrog
release-to-jfrog:
	$(PWD)/scripts/cd/JFROG.sh



.PHONY: all
all: clean helm-chart-listing helm-dep-build helm-chart-linting-manifest-validation-run
	
##@ General

# The help target prints out all targets with their descriptions organized
# beneath their categories. The categories are represented by '##@' and the
# target descriptions by '##'. The awk command is responsible for reading the
# entire set of makefiles included in this invocation, looking for lines of the
# file as xyz: ## something, and then pretty-format the target and help. Then,
# if there's a line with ##@ something, that gets pretty-printed as a category.
# More info on the usage of ANSI control characters for terminal formatting:
# https://en.wikipedia.org/wiki/ANSI_escape_code#SGR_parameters
# More info on the awk command:
# http://linuxcommand.org/lc3_adv_awk.php

.PHONY: help
help: ## Display this help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
