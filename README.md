# 3pl-test

This workspace contains generated configuration and a placeholder GitHub Actions workflow for onboarding automation.

Quick actions:

- Create feature branches and push generated configs:

```bash
GIT_USER="Your Name" GIT_EMAIL="you@example.com" ./scripts/publish-configs.sh
```

- The BTP workflow is at `.github/workflows/btp-Api-management-deploy.yml` and runs on pushes to the branch `feature-kk-btp-app-creation`.
