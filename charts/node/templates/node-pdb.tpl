{{- if .Values.node.pdb.enabled }}
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: {{ include "chainflip-node.fullname" . }}-pdb
  labels:
  {{- include "chainflip-node.labels" . | nindent 4 }}
spec:
  minAvailable: {{ .Values.node.pdb.minAvailable }}
  selector:
    matchLabels:
  {{- include "chainflip-node.selectorLabels" . | nindent 6 }}
{{- end }}
