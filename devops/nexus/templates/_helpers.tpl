{{/* Common fullname builder */}}
{{- define "common.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Back-compat: chart started as "nexus"; keep this name so tests and old templates work */}}
{{- define "nexus.fullname" -}}
{{- template "common.fullname" . -}}
{{- end -}}

{{/* Optional alias if you start switching templates to "nexus.fullname" later */}}
{{- define "nexus.fullname" -}}
{{- template "common.fullname" . -}}
{{- end -}}
