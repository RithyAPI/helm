# elasticsearch-simple (Helm)

A minimal single-node Elasticsearch Helm chart suitable for local labs and Argo CD demos.
- **Not for production**. Security is disabled (`xpack.security.enabled=false`).
- Uses `emptyDir` by default to avoid PVC issues. Enable persistence in `values.yaml`.

## Prerequisites
On each node that might run the pod:
```
sudo sysctl -w vm.max_map_count=262144
```
(Optionally persist via `/etc/sysctl.d/99-elasticsearch.conf`: `vm.max_map_count=262144`)

## Install
```
helm install es ./elasticsearch-simple
```

## Enable PVC (optional)
In `values.yaml`:
```yaml
persistence:
  enabled: true
  size: 20Gi
  storageClass: "standard"
```

## Access
```
kubectl port-forward svc/es-elasticsearch-simple 9200:9200
curl http://localhost:9200
```
