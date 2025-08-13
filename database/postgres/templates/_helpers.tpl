{{- define "pg.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "pg.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "pg.serviceAccountName" -}}
{{- $sa := .Values.serviceAccount | default dict -}}
{{- if ($sa.create | default false) -}}
{{- default (include "pg.fullname" .) $sa.name -}}
{{- else -}}
{{- default "default" $sa.name -}}
{{- end -}}
{{- end -}}

{{- define "pg.secretName" -}}
{{- if .Values.postgres.existingSecretName -}}
{{ .Values.postgres.existingSecretName }}
{{- else -}}
{{ include "pg.fullname" . }}-db
{{- end -}}
{{- end -}}
