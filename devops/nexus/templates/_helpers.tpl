{{/* ---- Common helpers (single source of truth) ---- */}}

{{- define "app.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "app.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/* Back-compat aliases: use these names in existing templates if you like */}}
{{- define "jenkins.fullname" -}} {{ template "app.fullname" . }} {{- end -}}
{{- define "jenkins.labels" -}} {{ template "app.labels" . }} {{- end -}}
{{- define "nexus.fullname" -}} {{ template "app.fullname" . }} {{- end -}}
{{- define "nexus.labels" -}} {{ template "app.labels" . }} {{- end -}}
