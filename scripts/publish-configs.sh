#!/usr/bin/env bash
set -euo pipefail

# Usage: GIT_USER="Name" GIT_EMAIL="email" ./scripts/publish-configs.sh

GIT_USER=${GIT_USER:-"automation-bot"}
GIT_EMAIL=${GIT_EMAIL:-"automation@local"}

git config user.name "$GIT_USER"
git config user.email "$GIT_EMAIL"

# Create and push MuleSoft feature branch
git checkout -b feature/mulesoft-config-update || git checkout feature/mulesoft-config-update
git add config/mulesoft/royal-canin-france/mulesoft-config.csv
git commit -m "Update MuleSoft NAV onboarding config via 3PL-Automation" || true
git push -u origin feature/mulesoft-config-update

# Create and push Solace feature branch
git checkout main
git checkout -b feature/solace-config-update || git checkout feature/solace-config-update
git add config/solace/petc-rc-navision-3plpnp.csv config/solace/petc-rc-navision-3plpnp.json
git commit -m "Update Solace onboarding config via 3PL-Automation" || true
git push -u origin feature/solace-config-update

echo "Done. Use 'gh' to create PRs if desired, e.g. 'gh pr create --base main --head feature/mulesoft-config-update'"
