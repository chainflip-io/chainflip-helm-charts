{{- define "engine.template" -}}
- name: chainflip-engine
  image: "{{ include "chainflip-engine.image" . }}"
  imagePullPolicy: {{ .Values.engine.image.pullPolicy }}
  command:
    - /usr/local/bin/chainflip-engine
  args:
    - --config-root={{ .Values.common.basePath }}
  {{- with .Values.engine.extraArgs }}
  {{- toYaml . | nindent 12 }}
  {{- end }}
  ports:
    - containerPort: {{ .Values.engine.ports.ip.port }}
      name: ip
      protocol: TCP
    {{- if .Values.engine.ports.metrics.enabled }}
    - containerPort: {{ .Values.engine.ports.metrics.port }}
      name: metrics
      protocol: TCP
    {{- end }}
    {{- if  .Values.engine.ports.healthcheck.enabled }}
    - containerPort: {{ .Values.engine.ports.healthcheck.port }}
      name: healthcheck
  readinessProbe:
    httpGet:
      path: /health
      port: healthcheck
    initialDelaySeconds: 10
    periodSeconds: 10
    timeoutSeconds: 5
    successThreshold: 1
    failureThreshold: 3
  livenessProbe:
    httpGet:
      path: /health
      port: healthcheck
    initialDelaySeconds: 10
    periodSeconds: 10
    timeoutSeconds: 5
    successThreshold: 1
    failureThreshold: 3
    {{- end }}
  {{- with .Values.engine.resources }}
  resources:
  {{- toYaml . | nindent 12 }}
  {{- end }}
  volumeMounts:
    - name: data
      mountPath: {{ .Values.common.basePath }}
    - name: keys
      mountPath: {{ .Values.common.keys.keysPath }}
      readOnly: true
    - name: settings
      mountPath: {{ .Values.common.basePath }}/config
      readOnly: true
  {{- with .Values.engine.extraEnv }}
  env:
  {{- toYaml . | nindent 12 }}
  {{- end }}
  {{- with .Values.engine.extraEnvFrom }}
  envFrom:
  {{- toYaml . | nindent 12 }}
  {{- end }}
{{- end }}