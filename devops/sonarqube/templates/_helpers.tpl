{{- define "sonarqube.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "sonarqube.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "sonarqube.serviceAccountName" -}}
{{- $sa := .Values.serviceAccount | default dict -}}
{{- if ($sa.create | default false) -}}
{{- default (include "sonarqube.fullname" .) $sa.name -}}
{{- else -}}
{{- default "default" $sa.name -}}
{{- end -}}
{{- end -}}
