{{- define "hockey.name" -}}
{{- default .Chart.Name .Values.nameOverride -}}
{{- end -}}

{{- define "hockey.fullname" -}}
{{- printf "%s" (include "hockey.name" .) -}}
{{- end -}}

{{- define "hockey.redisAddr" -}}
{{- printf "%s.%s.svc.cluster.local:%d" (include "hockey.fullname" .) .Release.Namespace .Values.redis.service.port -}}
{{- end -}}
