{{/*
Common helpers for the github-secrets chart
*/}}
{{- define "github-secrets.fullname" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- /*
	sanitize: turn arbitrary input into a DNS-1123 compatible lowercase name
	- lowercases
	- replaces any run of invalid characters with '-'
	- trims leading/trailing '-'
*/ -}}
{{- define "github-secrets.sanitize" -}}
{{- $in := lower . -}}
{{- $step1 := regexReplaceAll "[^a-z0-9-]+" $in "-" -}}
{{- $step2 := regexReplaceAll "^-+" $step1 "" -}}
{{- $out := regexReplaceAll "-+$" $step2 "" -}}
{{- $out -}}
{{- end -}}
