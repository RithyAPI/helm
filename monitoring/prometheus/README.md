# simple-prometheus (Helm)

Minimal Prometheus Helm chart suited for Argo CD.

## Quick start

```bash
helm upgrade --install prom simple-prometheus/ --namespace monitoring --create-namespace
```

Key values to tweak in `values.yaml`:
- `service.type`: ClusterIP | NodePort | LoadBalancer
- `persistence.enabled`: true/false
- `persistence.storageClass`: your StorageClass name
- `ingress.enabled`: true/false
- `extraScrapeConfigs`: add custom scrape jobs
```yaml
extraScrapeConfigs:
  - job_name: 'example'
    static_configs:
      - targets: ['my-app:8080']
```

## Argo CD Application example

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: prometheus
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://your.git.repo/some/path.git
    targetRevision: main
    path: charts/simple-prometheus
    helm:
      releaseName: prom
      values: |
        service:
          type: NodePort
        persistence:
          enabled: true
  destination:
    server: https://kubernetes.default.svc
    namespace: monitoring
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true
```

> Tip: unzip this package, commit it to your Git repo, and point Argo CD at the chart path.
