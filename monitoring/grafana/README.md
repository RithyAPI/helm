# simple-grafana (Helm)

Minimal Grafana Helm chart, pre-provisioned with a Prometheus datasource.

## Quick start (Helm CLI)

```bash
helm upgrade --install grafana ./simple-grafana   --namespace monitoring --create-namespace   --set datasource.prometheus.url="http://192.168.8.22:32442"
```

## Argo CD Application example

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: grafana
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://your.git.repo/some/path.git
    targetRevision: main
    path: charts/simple-grafana
    helm:
      releaseName: grafana
      values: |
        service:
          type: NodePort
        persistence:
          enabled: true
        datasource:
          prometheus:
            url: "http://192.168.8.22:32442"
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

## Credentials

- Default admin user/pass are set via a Secret (change in `values.yaml` or provide `existingSecret`).

## Notes

- If you enable Ingress, set `ingress.enabled=true` and provide host/TLS.
- Persistence can be disabled by setting `persistence.enabled=false`.
