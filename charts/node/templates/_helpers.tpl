{{- define "node.fullname" -}}
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
Create chart name and version as used by the chart label.
*/}}
{{- define "node.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "node.labels" -}}
helm.sh/chart: {{ include "node.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
chainflip.io/chain: {{ .Values.network.chain.name }}
chainflip.io/role: {{ .Values.common.role }}
{{- end }}

{{- define "compareVersions" -}}
{{ lt (semver .Values.engine.image.lsr_tag | (semver .Values.engine.image.current_tag).Compare) 0 }}
{{- end -}}

{{/*-----------*/}}

{{- define "chainflip-node.fullname" -}}
{{- $name := "chainflip-node" }}
{{- if .Values.node.fullnameOverride }}
{{- .Values.node.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "chainflip-node.labels" -}}
{{ include "node.labels" . }}
{{ include "chainflip-node.selectorLabels" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "chainflip-node.selectorLabels" -}}
chainflip.io/unit: chainflip-node
chainflip.io/name: {{ .Release.Name }}
{{- end }}

{{/*
Chain name
*/}}
{{- define "chainflip-node.chain" -}}
{{- $chain := .Values.network.chain.name | required ".Values.network.chain.name is required." -}}
{{- if .Values.network.chain.chainspecUrl }}
{{- printf "%s/%s.chainspec.json" .Values.common.basePath $chain }}
{{- else -}}
{{- printf "%s" $chain }}
{{- end }}
{{- end }}

{{/*
chainflip-node image
*/}}
{{- define "chainflip-node.image" -}}
{{ printf "%s:%s" .Values.node.image.repository (.Values.node.image.tag | default .Values.network.chain.name) }}
{{- end }}

{{/*---------*/}}

{{- define "chainflip-engine.fullname" -}}
{{- $name := "chainflip-engine" }}
{{- if .Values.engine.fullnameOverride }}
{{- .Values.engine.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "chainflip-engine.labels" -}}
{{ include "node.labels" . }}
{{ include "chainflip-engine.selectorLabels" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "chainflip-engine.selectorLabels" -}}
chainflip.io/name: {{ .Release.Name }}
chainflip.io/unit: chainflip-engine
{{- end }}

{{/*-----------*/}}
{{- define "chainflip-cli.fullname" -}}
{{- $name := "chainflip-cli" }}
{{- if .Values.cli.fullnameOverride }}
{{- .Values.node.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
chainflip-engine image
*/}}
{{- define "chainflip-engine.image" -}}
{{ printf "%s:%s" .Values.engine.image.repository (.Values.engine.image.current_tag | default .Values.network.chain.name) }}
{{- end }}

{{/*
chainflip-engine lsr image
*/}}
{{- define "chainflip-engine-lsr.image" -}}
{{ printf "%s:%s" .Values.engine.image.repository (.Values.engine.image.lsr_tag) }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "chainflip-cli.labels" -}}
{{ include "node.labels" . }}
{{ include "chainflip-cli.selectorLabels" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "chainflip-cli.selectorLabels" -}}
chainflip.io/unit: chainflip-cli
{{- end }}

{{/*
chainflip-cli image
*/}}
{{- define "chainflip-cli.image" -}}
{{ printf "%s:%s" .Values.cli.image.repository (.Values.cli.image.tag | default .Values.network.chain.name) }}
{{- end }}