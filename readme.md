
# git mirror action

## step

- add SECRETS with the name SSH_PRIVATE_KEY for git clone
- add .github/workflows/mirror.yml into a repository with follow content
- push

```yaml

name: mirror

on: push

jobs:
  sync:
    runs-on: ubuntu-latest
    steps:
      - uses: c332030/git-mirror-action@1.0
        timeout-minutes: 2
        env:
          SSH_PRIVATE_KEY: ${{ secrets.SSH_PRIVATE_KEY }}
        with:
          source-repo: git@github.com:${{ github.repository_owner }}/${{ github.event.repository.name }}.git
          destination-repo: git@gitee.com:${{ github.repository_owner }}/${{ github.event.repository.name }}.git

```

modify from wearerequired/git-mirror-action
