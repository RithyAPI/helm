{{- define "app.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "app.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "nexus.fullname" -}} {{ template "app.fullname" . }} {{- end -}}
{{- define "nexus.labels" -}} {{ template "app.labels" . }} {{- end -}}

{{- define "nexus.serviceAccountName" -}}
{{- $sa := .Values.serviceAccount | default dict -}}
{{- if ($sa.create | default false) -}}
{{- default (include "nexus.fullname" .) $sa.name -}}
{{- else -}}
{{- default "default" $sa.name -}}
{{- end -}}
{{- end -}}
