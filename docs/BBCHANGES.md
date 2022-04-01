# Changes needed for Big Bang

Due to how BB uses RapidFort and the differences in environments there are some changes to templates and values that needed to be made.

## Aggregator

### Autoscaling

To avoid compaitibility issues the apiVersion of autoscaling was changed to `v2beta2` from `v2beta1` in `chart/charts/aggregator/templates/hpa.yaml`

```
apiVersion: autoscaling/v2beta2
```

This also required yaml changes because of syntax changes between the apiVersions at `spec.metrics.resource`

```
targetAverageUtilization: {{ .Values.autoscaling.targetCPUUtilizationPercentage }}
target: 
  type: Utilization
  averageUtilization: {{ .Values.autoscaling.targetCPUUtilizationPercentage }}
```
```
targetAverageUtilization: {{ .Values.autoscaling.targetMemoryUtilizationPercentage }}
target: 
  type: Utilization
  averageUtilization: {{ .Values.autoscaling.targetMemoryUtilizationPercentage }}
```

## Backend

### Autoscaling

To avoid compaitibility issues the apiVersion of autoscaling was changed to `v2beta2` from `v2beta1` in `chart/charts/backend/templates/hpa.yaml`

```
apiVersion: autoscaling/v2beta2
```

This also required yaml changes because of syntax changes between the apiVersions at `spec.metrics.resource`

```
targetAverageUtilization: {{ .Values.autoscaling.targetCPUUtilizationPercentage }}
target: 
  type: Utilization
  averageUtilization: {{ .Values.autoscaling.targetCPUUtilizationPercentage }}
```
```
targetAverageUtilization: {{ .Values.autoscaling.targetMemoryUtilizationPercentage }}
target: 
  type: Utilization
  averageUtilization: {{ .Values.autoscaling.targetMemoryUtilizationPercentage }}
```

## Frontrow

No changes at this time.

## ISO-Master

### Init Container

The init container for iso-master was hardcoded to an aws registry so that was changed to reference a value that could be overridden by the parent chart at `spec.template.spec.initContainers` in `chart/charts/iso-master/templates/deployment.yaml`

```
image: "{{ .Values.initContainer.image.repository }}:{{ .Values.initContainer.image.tag | default .Chart.AppVersion }}"
command: ['sh', '-c', "echo loaded {{ .Values.initContainer.image.repository }}"]
```

Values were added to facilitate the above change at `chart/charts/iso-master/values.yaml`

```
initContainer:
  image:
    repository: 274057717848.dkr.ecr.us-east-1.amazonaws.com/rfstub.alp.base
    tag: latest
```

## Keycloak

### Init Container

The init container for keycloak was hardcoded to an aws registry so that was changed to reference a value that could be overridden by the parent chart at `spec.template.spec.initContainers` in `chart/charts/keycloak/templates/deployment.yaml`

```
image: "{{ .Values.initContainer.image.repository }}:{{ .Values.initContainer.image.tag | default .Chart.AppVersion }}"
```

Values were added to facilitate the above change at `chart/charts/keycloak/values.yaml`

```
initContainer:
  image:
    repository: 274057717848.dkr.ecr.us-east-1.amazonaws.com/init
    tag: latest
```

### Autoscaling

To avoid compaitibility issues the apiVersion of autoscaling was changed to `v2beta2` from `v2beta1` in `chart/charts/keycloak/templates/hpa.yaml`

```
apiVersion: autoscaling/v2beta2
```

This also required yaml changes because of syntax changes between the apiVersions at `spec.metrics.resource`

```
targetAverageUtilization: {{ .Values.autoscaling.targetCPUUtilizationPercentage }}
target: 
  type: Utilization
  averageUtilization: {{ .Values.autoscaling.targetCPUUtilizationPercentage }}
```
```
targetAverageUtilization: {{ .Values.autoscaling.targetMemoryUtilizationPercentage }}
target: 
  type: Utilization
  averageUtilization: {{ .Values.autoscaling.targetMemoryUtilizationPercentage }}
```

### Helm Test Container

The image reference for the helm test container was hardcoded to a generic busybox image so it was changed to reference a value that could be overridden by the parent chart at `spec.containers` in `chart/charts/keycloak/templates/tests/test-connection.yaml`

```
image: "{{ .Values.connectionTest.image.repository }}:{{ .Values.connectionTest.image.tag | default .Chart.AppVersion }}"
```

Values were added to facilitate the above change at `chart/charts/keycloak/values.yaml`

```
connectionTest:
image:
  repository: busybox
  tag: latest
```

## Redis

### Autoscaling

To avoid compaitibility issues the apiVersion of autoscaling was changed to `v2beta2` from `v2beta1` in `chart/charts/redis/templates/hpa.yaml`

```
apiVersion: autoscaling/v2beta2
```

This also required yaml changes because of syntax changes between the apiVersions at `spec.metrics.resource`

```
targetAverageUtilization: {{ .Values.autoscaling.targetCPUUtilizationPercentage }}
target: 
  type: Utilization
  averageUtilization: {{ .Values.autoscaling.targetCPUUtilizationPercentage }}
```
```
targetAverageUtilization: {{ .Values.autoscaling.targetMemoryUtilizationPercentage }}
target: 
  type: Utilization
  averageUtilization: {{ .Values.autoscaling.targetMemoryUtilizationPercentage }}
```

### Helm Test Container

The image reference for the helm test container was hardcoded to a generic busybox image so it was changed to reference a value that could be overridden by the parent chart at `spec.containers` in `chart/charts/redis/templates/tests/test-connection.yaml`

```
image: "{{ .Values.connectionTest.image.repository }}:{{ .Values.connectionTest.image.tag | default .Chart.AppVersion }}"
```

Values were added to facilitate the above change at `chart/charts/redis/values.yaml`

```
connectionTest:
image:
  repository: busybox
  tag: latest
```

## RFAPI

### Autoscaling

To avoid compaitibility issues the apiVersion of autoscaling was changed to `v2beta2` from `v2beta1` in `chart/charts/rfapi/templates/hpa.yaml`

```
apiVersion: autoscaling/v2beta2
```

This also required yaml changes because of syntax changes between the apiVersions at `spec.metrics.resource`

```
targetAverageUtilization: {{ .Values.autoscaling.targetCPUUtilizationPercentage }}
target: 
  type: Utilization
  averageUtilization: {{ .Values.autoscaling.targetCPUUtilizationPercentage }}
```
```
targetAverageUtilization: {{ .Values.autoscaling.targetMemoryUtilizationPercentage }}
target: 
  type: Utilization
  averageUtilization: {{ .Values.autoscaling.targetMemoryUtilizationPercentage }}
```

### Helm Test Container

The image reference for the helm test container was hardcoded to a generic busybox image so it was changed to reference a value that could be overridden by the parent chart at `spec.containers` in `chart/charts/rfapi/templates/tests/test-connection.yaml`

```
image: "{{ .Values.connectionTest.image.repository }}:{{ .Values.connectionTest.image.tag | default .Chart.AppVersion }}"
```

Values were added to facilitate the above change at `chart/charts/rfapi/values.yaml`

```
connectionTest:
image:
  repository: busybox
  tag: latest
```

## RFPUBSUB

### Autoscaling

To avoid compaitibility issues the apiVersion of autoscaling was changed to `v2beta2` from `v2beta1` in `chart/charts/rfpubsub/templates/hpa.yaml`

```
apiVersion: autoscaling/v2beta2
```

This also required yaml changes because of syntax changes between the apiVersions at `spec.metrics.resource`

```
targetAverageUtilization: {{ .Values.autoscaling.targetCPUUtilizationPercentage }}
target: 
  type: Utilization
  averageUtilization: {{ .Values.autoscaling.targetCPUUtilizationPercentage }}
```
```
targetAverageUtilization: {{ .Values.autoscaling.targetMemoryUtilizationPercentage }}
target: 
  type: Utilization
  averageUtilization: {{ .Values.autoscaling.targetMemoryUtilizationPercentage }}
```

## RFVDB

### Init Container

The init container for rfvdb was hardcoded to an aws registry so that was changed to reference a value that could be overridden by the parent chart at `spec.template.spec.initContainers` in `chart/charts/rfvdb/templates/deployment.yaml`

```
image: "{{ .Values.initContainer.image.repository }}:{{ .Values.initContainer.image.tag | default .Chart.AppVersion }}"
```

Values were added to facilitate the above change at `chart/charts/rfvdb/values.yaml`

```
initContainer:
  image:
    repository: 274057717848.dkr.ecr.us-east-1.amazonaws.com/init
    tag: latest
```

### Autoscaling

To avoid compaitibility issues the apiVersion of autoscaling was changed to `v2beta2` from `v2beta1` in `chart/charts/rfvdb/templates/hpa.yaml`

```
apiVersion: autoscaling/v2beta2
```

This also required yaml changes because of syntax changes between the apiVersions at `spec.metrics.resource`

```
targetAverageUtilization: {{ .Values.autoscaling.targetCPUUtilizationPercentage }}
target: 
  type: Utilization
  averageUtilization: {{ .Values.autoscaling.targetCPUUtilizationPercentage }}
```
```
targetAverageUtilization: {{ .Values.autoscaling.targetMemoryUtilizationPercentage }}
target: 
  type: Utilization
  averageUtilization: {{ .Values.autoscaling.targetMemoryUtilizationPercentage }}
```

### Helm Test Container

The image reference for the helm test container was hardcoded to a generic busybox image so it was changed to reference a value that could be overridden by the parent chart at `spec.containers` in `chart/charts/rfvdb/templates/tests/test-connection.yaml`

```
image: "{{ .Values.connectionTest.image.repository }}:{{ .Values.connectionTest.image.tag | default .Chart.AppVersion }}"
```

Values were added to facilitate the above change at `chart/charts/rfvdb/values.yaml`

```
connectionTest:
image:
  repository: busybox
  tag: latest
```

## Runner

### Init Container

The init container for runner was hardcoded to an aws registry so that was changed to reference a value that could be overridden by the parent chart at `spec.template.spec.initContainers` in `chart/charts/runner/templates/deployment.yaml`

```
image: "{{ .Values.initContainer.image.repository }}:{{ .Values.initContainer.image.tag | default .Chart.AppVersion }}"
```

Values were added to facilitate the above change at `chart/charts/runner/values.yaml`

```
initContainer:
  image:
    repository: 274057717848.dkr.ecr.us-east-1.amazonaws.com/init
    tag: latest
```