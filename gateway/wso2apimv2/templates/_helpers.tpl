{{- define "wso2am.fullname" -}}
{{- printf "%s" .Release.Name -}}
{{- end }}

{{- define "wso2am.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "wso2am.selectorLabels" -}}
app: wso2am
{{- end }}
