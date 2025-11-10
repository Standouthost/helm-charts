# github-secrets Helm chart

This chart deploys two ExternalSecrets resources for each repository in the
`repos` list in `values.yaml`:

- `ClusterSecretStore` configured for the GitHub provider (named
	`github-<organization>-<repo>`)
- `PushSecret` which pushes a Kubernetes Secret's keys to GitHub Actions secrets
	(named `github-docker-secrets-<organization>-<repo>`) and referencing the
	corresponding ClusterSecretStore.

Files are templated and driven by `values.yaml`. By default the chart uses the
`repos` array (populated with your provided list) and the `clusterSecretStore`
and `pushSecret` sections for shared configuration such as `appID`,
`installationID`, private key name, deletion policy and refresh interval.

How to render and test (requires Helm 3+):

```bash
# render templates
helm template my-release ./charts/github-secrets

# dry-run install into cluster
helm install my-release ./charts/github-secrets --dry-run --debug

# install for real (choose a release name and optionally override values)
helm upgrade --install my-release ./charts/github-secrets -n github-secrets --create-namespace
```

To override values, either edit `values.yaml` or pass `--set` flags. Example:

```bash
# override the repos list (comma-separated) and the GitHub appID
helm upgrade --install my-release ./charts/github-secrets \
	--set repos={repo-a,repo-b,repo-c} \
	--set clusterSecretStore.provider.github.appID=12345
```

Notes:
- The generated resource names are truncated to 63 chars to be DNS-compatible.
- The chart creates a ClusterSecretStore and PushSecret per repo in `repos`.
- If you prefer a single ClusterSecretStore for multiple repos, we can add an
	option to control naming; tell me if you'd like that.
