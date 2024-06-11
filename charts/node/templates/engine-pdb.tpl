{{- if .Values.engine.pdb.enabled }}
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: {{ include "chainflip-engine.fullname" . }}-pdb
  labels:
  {{- include "chainflip-engine.labels" . | nindent 4 }}
spec:
  minAvailable: {{ .Values.engine.pdb.minAvailable }}
  selector:
    matchLabels:
  {{- include "chainflip-engine.selectorLabels" . | nindent 6 }}
{{- end }}
