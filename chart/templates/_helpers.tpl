{{/*
Expand the name of the chart.
*/}}
{{- define "rapidfort-platform.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "rapidfort-platform.fullname" -}}
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
{{- define "rapidfort-platform.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "rapidfort-platform.labels" -}}
helm.sh/chart: {{ include "rapidfort-platform.chart" . }}
{{ include "rapidfort-platform.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "rapidfort-platform.selectorLabels" -}}
app.kubernetes.io/name: {{ include "rapidfort-platform.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "rapidfort-platform.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "rapidfort-platform.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "prefix.isIPAddress" -}}
{{- $rc := . -}}
{{- $parts := splitList "." . -}}
{{- if eq (len $parts) 4 -}}
    {{- range $parts -}}
        {{- if and (not (atoi .)) (ne . "0") -}}
            {{- $rc = "" -}}
        {{- end -}}
    {{- end -}}
{{- else -}}
    {{- $rc = "" -}}
{{- end -}}
{{- print $rc }}
{{- end -}}

{{- define "prefix.isFQDN" -}}
{{- $rc := . -}}
{{- if not (include "prefix.isIPAddress" $rc ) -}}
    {{- print $rc -}}
{{- end -}}
{{- end -}}

{{/*
Create the volume claim template
*/}}
{{- define "rapidfort-platform.singleVolumeClaim" -}}
- metadata:
    name: {{ .name }}
  spec:
    accessModes:
    - {{ .accessMode }}
    storageClassName: {{ .storageClassName }}
    resources:
      requests:
        storage: {{ .size }}
{{- end -}}

{{/*
Create the ephemeral volume claims
*/}}
{{- define "rapidfort-platform.singleEphemeralVolumeClaim" -}}
- name: {{ .name }}
  ephemeral:
    volumeClaimTemplate:
      metadata:
        labels:
          type: {{ .name }}-volume
      spec:
          accessModes:
          - {{ .accessMode }}
          storageClassName: {{ .storageClassName}}
          resources:
            requests:
              storage: {{ .size }}
{{- end -}}


{{- define "rapidfort-platform.ingress.tls" -}}
tls:
  - hosts:
      - {{ include "prefix.isFQDN" $.Values.global.hostname | quote }}
    secretName: {{ .Values.global.ingress.tls.secretName }}
{{- end -}}

{{- define "rapidfort-platform.db_url" -}}
  {{- if not .Values.mysql.enabled }}
    {{- if and .Values.db.auth.username .Values.db.auth.password .Values.db.auth.host .Values.db.auth.port .Values.db.auth.db_name }}
      {{- if and .Values.db.ssl }}
        {{- if .Values.db.ssl.certFile }}
          {{- printf "mysql+mysqldb://%s:%s@%s:%s/%s?ssl=true&ssl_ca=/opt/rapidfort/tls/%s" .Values.db.auth.username .Values.db.auth.password .Values.db.auth.host .Values.db.auth.port .Values.db.auth.db_name .Values.db.ssl.certFile }}
        {{- else }}
          {{- printf "mysql+mysqldb://%s:%s@%s:%s/%s?ssl=true" .Values.db.auth.username .Values.db.auth.password .Values.db.auth.host .Values.db.auth.port .Values.db.auth.db_name }}
        {{- end }}
      {{- else }}
        {{- printf "mysql+mysqldb://%s:%s@%s:%s/%s" .Values.db.auth.username .Values.db.auth.password .Values.db.auth.host .Values.db.auth.port .Values.db.auth.db_name }}
      {{- end }}
    {{- end }}
  {{- else }}
    {{- printf "mysql+mysqldb://%s:%s@%s:%s/%s" .Values.db.auth.username .Values.db.auth.password .Values.db.auth.host .Values.db.auth.port .Values.db.auth.db_name }}
  {{- end }}
{{- end }}

{{- define "rapidfort-platform.jdbc_db_url" -}}
  {{- if not .Values.mysql.enabled  }}
    {{- if and .Values.db.auth.host .Values.db.auth.port }}
      {{- if and .Values.db.ssl }}
        {{- if .Values.db.ssl.certFile }}
          {{- printf "jdbc:mysql://%s:%s@%s:%s/keycloak?ssl=true&ssl_ca=/opt/rapidfort/tls/%s" .Values.db.auth.username .Values.db.auth.password .Values.db.auth.host .Values.db.auth.port .Values.db.ssl.certFile }}
        {{- else }}
          {{- printf "jdbc:mysql://%s:%s@%s:%s/keycloak?ssl=true" .Values.db.auth.username .Values.db.auth.password .Values.db.auth.host .Values.db.auth.port }}
        {{- end }}
      {{- else }}
        {{- printf "jdbc:mysql://%s:%s@%s:%s/keycloak" .Values.db.auth.username .Values.db.auth.password .Values.db.auth.host .Values.db.auth.port }}
      {{- end }}
    {{- end }}
  {{- else }}
    {{- printf "jdbc:mysql://%s:%s@%s:%s/keycloak" .Values.db.auth.username .Values.db.auth.password .Values.db.auth.host .Values.db.auth.port }}
  {{- end }}
{{- end }}

{{/*
Create Volume Mount for SSL Cert
*/}}
{{- define "rapidfort-platform.db_ssl_cert_volume" -}}
- name: {{ .secretName }}
  secret:
    secretName: {{ .secretName }}
{{- end -}}

{{- define "rapidfort-platform.db_ssl_cert_volumeMount" -}}
- name: {{ .secretName }}
  mountPath: /opt/rapidfort/tls/cert.pem
  subPath: cert.pem
{{- end -}}