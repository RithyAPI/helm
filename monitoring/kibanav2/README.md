# kibana-simple (Helm)

A minimal Kibana Helm chart suitable for local labs and Argo CD demos.
- Connects to elasticsearch-simple (default `http://es-elasticsearch-simple:9200`).
- Not for production (no security, single replica).

## Install
```
helm install kb ./kibana-simple
```

## Change Elasticsearch URL
In `values.yaml`:
```yaml
elasticsearchURL: "http://<es-service-name>:9200"
```

## Access
```
kubectl port-forward svc/kb-kibana-simple 5601:5601
open http://localhost:5601
```
