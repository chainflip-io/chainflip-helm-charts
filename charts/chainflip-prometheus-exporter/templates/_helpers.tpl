{{- define "chainflip-prometheus-exporter.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Expand the name of the chart.
*/}}
{{- define "chainflip-prometheus-exporter.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "chainflip-prometheus-exporter.selectorLabels" -}}
app.kubernetes.io/name: {{ include "chainflip-prometheus-exporter.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}