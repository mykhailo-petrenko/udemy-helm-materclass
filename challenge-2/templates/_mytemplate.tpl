{{- define "mylabels" -}}
app: nginx
location: frontend
server: proxy
{{- end -}}


{{- define "nginxcontainer" -}}
- name: nginxcontainer
  image: "{{ .Values.deployment.image.app }}:{{ .Values.deployment.image.version }}"
  ports:
  - name: http
    containerPort: 80
    protocol: TCP
{{- end -}}