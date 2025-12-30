{{- define "immich.fullname" -}}
{{- printf "%s-%s" .Release.Name "immich" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
