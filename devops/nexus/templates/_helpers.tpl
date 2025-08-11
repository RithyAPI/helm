{{- define "nexus.fullname" -}}
{{- printf "%s-%s" .Release.Name "nexus" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
