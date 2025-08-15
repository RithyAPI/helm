# Keycloak Helm Chart

A self-contained Helm chart for deploying Keycloak on Kubernetes. It can either provision a bundled PostgreSQL instance or connect to an external database.

## Quickstart

```bash
helm install keycloak ./keycloak-helm-chart \
  -n keycloak --create-namespace \
  --set adminPassword="StrongP@ssw0rd" \
  --set ingress.enabled=true \
  --set ingress.hostname=keycloak.example.com
```

To use an external DB:
```bash
helm install keycloak ./keycloak-helm-chart -n keycloak --create-namespace \
  --set postgresql.enabled=false \
  --set externalDatabase.enabled=true \
  --set externalDatabase.host=db.example.com \
  --set externalDatabase.database=keycloak \
  --set externalDatabase.user=kcuser \
  --set externalDatabase.passwordSecret.name=kc-db-secret \
  --set externalDatabase.passwordSecret.key=password
```
