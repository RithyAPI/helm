{{- define "kafka.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "kafka.fullname" -}}
{{- if .Release.Name -}}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- include "kafka.name" . -}}
{{- end -}}
{{- end -}}

{{- define "kafka.labels" -}}
app.kubernetes.io/name: {{ include "kafka.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: Helm
{{- end -}}

{{- define "kafka.controllerQuorumVoters" -}}
{{- $replicas := (int .Values.replicas) -}}
{{- $headless := printf "%s.%s.svc.cluster.local" (printf "%s-%s" (include "kafka.fullname" .) .Values.headless.name) .Release.Namespace -}}
{{- $port := .Values.headless.controllerPort | default 9093 -}}
{{- $out := list -}}
{{- range $i, $_ := until $replicas -}}
{{- $entry := printf "%d@%s-%d.%s:%d" $i (include "kafka.fullname" $) $i $headless $port -}}
{{- $out = append $out $entry -}}
{{- end -}}
{{- join "," $out -}}
{{- end -}}
