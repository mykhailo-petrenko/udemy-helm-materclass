{{- define "serviceport" -}}
- port: {{ .Values.service.port }}
  targetPort: {{ .Values.service.targetPort }}
  protocol: TCP
  name: http
  {{- if eq .Values.service.type "NodePort" }}
  nodePort: {{ .Values.service.nodePort }}
  {{- else if eq .Values.service.type "ClusterIP" }}
  nodePort: {{ .Values.service.clusterIPPort }}
  {{- else if eq .Values.service.type "LoadBalancer" }}
  nodePort: {{ .Values.service.loadBalancerPort }}
  {{- end -}}
{{- end -}}