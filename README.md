# bigbang-rapidfort

![Version: 1.2.4-bb.10](https://img.shields.io/badge/Version-1.2.4--bb.10-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.1.45](https://img.shields.io/badge/AppVersion-1.1.45-informational?style=flat-square)

BigBang compatible Helm chart for RapidFort

## Learn More
* [Application Overview](docs/overview.md)
* [Other Documentation](docs/)

## Pre-Requisites

* Kubernetes Cluster deployed
* Kubernetes config installed in `~/.kube/config`
* Helm installed

Install Helm

https://helm.sh/docs/intro/install/

## Deployment

* Clone down the repository
* cd into directory
```bash
helm install bigbang-rapidfort chart/
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| rapidfort.enabled | bool | `true` |  |
| rapidfort.sourceType | string | `"git"` |  |
| rapidfort.git.repo | string | `"https://repo1.dso.mil/platform-one/big-bang/apps/third-party/rapidfort"` |  |
| rapidfort.git.branch | string | `"main"` |  |
| rapidfort.git.path | string | `"chart"` |  |
| rapidfort.helmRepo.repoName | string | `"registry1"` |  |
| rapidfort.helmRepo.chartName | string | `"rapidfort"` |  |
| rapidfort.helmRepo.tag | string | `"1.2.4-bb.0"` |  |
| rapidfort.flux | object | `{}` |  |
| rapidfort.ingress.gateway | string | `""` |  |
| rapidfort.objectStorage.aws_access_key_id | string | `"AKI***"` | Access key for connecting to object storage endpoint. |
| rapidfort.objectStorage.aws_secret_access_key | string | `"Fh***"` | Secret key for connecting to object storage endpoint. |
| rapidfort.objectStorage.aws_default_region | string | `"us-east-1"` | Region that bucket is in |
| rapidfort.objectStorage.s3_bucket | string | `"rapidfort-bucket"` | Bucket name to use for RapidFort |
| rapidfort.objectStorage.rf_app_admin | string | `"test@rapidfort.com"` |  |
| rapidfort.objectStorage.rf_app_admin_password | string | `"test123"` |  |
| rapidfort.objectStorage.imagePullSecret | string | `""` |  |
| rapidfort.objectStorage.aws_role_arn | string | `""` |  |
| domain | string | `"bigbang.dev"` |  |
| networkPolicies.enabled | bool | `true` |  |
| istioOperator.enabled | bool | `true` |  |
| istio.enabled | bool | `true` |  |
| neuvector.enabled | bool | `false` |  |
| kyvernoPolicies.enabled | bool | `false` |  |
| kyvernoPolicies.values.policies.restrict-image-registries.enabled | bool | `true` |  |
| kyvernoPolicies.values.policies.restrict-image-registries.validationFailureAction | string | `"Audit"` |  |
| kyvernoPolicies.values.policies.restrict-image-registries.parameters.allow | list | `["registry1.dso.mil","public.ecr.aws/rapidfort","274057717848.dkr.ecr.us-east-1.amazonaws.com"]` | List of allowed registries that images may use |
| kyvernoPolicies.values.policies.require-non-root-user.enabled | bool | `true` |  |
| kyvernoPolicies.values.policies.require-non-root-user.validationFailureAction | string | `"audit"` |  |
| kyvernoPolicies.values.policies.require-non-root-user.parameters.excludeContainers[0] | string | `"isomaster*"` |  |
| kyvernoPolicies.values.policies.require-non-root-user.parameters.excludeContainers[1] | string | `"runner*"` |  |
| kyvernoPolicies.values.policies.require-non-root-user.parameters.excludeContainers[2] | string | `"vulnsdb*"` |  |
| kyvernoPolicies.values.policies.require-non-root-group.enabled | bool | `true` |  |
| kyvernoPolicies.values.policies.require-non-root-group.validationFailureAction | string | `"audit"` |  |
| kyvernoPolicies.values.policies.require-non-root-group.parameters.excludeContainers[0] | string | `"mysql*"` |  |
| kyvernoPolicies.values.policies.require-non-root-group.parameters.excludeContainers[1] | string | `"redis*"` |  |
| kyvernoPolicies.values.policies.require-non-root-group.parameters.excludeContainers[2] | string | `"filesredis*"` |  |
| kyvernoPolicies.values.policies.require-non-root-group.parameters.excludeContainers[3] | string | `"lockredis*"` |  |
| kyvernoPolicies.values.policies.require-non-root-group.parameters.excludeContainers[4] | string | `"keycloak*"` |  |
| kyvernoPolicies.values.policies.require-non-root-group.parameters.excludeContainers[5] | string | `"runner*"` |  |
| kyvernoPolicies.values.policies.require-non-root-group.parameters.excludeContainers[6] | string | `"isomaster*"` |  |
| kyvernoPolicies.values.policies.require-non-root-group.parameters.excludeContainers[7] | string | `"vulnsdb*"` |  |
| gatekeeper.enabled | bool | `false` |  |
| gatekeeper.values.controllerManager.resources.limits.cpu | string | `"400m"` |  |
| gatekeeper.values.controllerManager.resources.limits.memory | string | `"2048Mi"` |  |
| gatekeeper.values.controllerManager.resources.requests.cpu | string | `"175m"` |  |
| gatekeeper.values.controllerManager.resources.requests.memory | string | `"512Mi"` |  |
| gatekeeper.values.violations.allowedDockerRegistries.parameters.repos[0] | string | `"registry1.dso.mil"` |  |
| gatekeeper.values.violations.allowedDockerRegistries.parameters.repos[1] | string | `"public.ecr.aws/rapidfort"` |  |
| gatekeeper.values.violations.allowedDockerRegistries.parameters.repos[2] | string | `"274057717848.dkr.ecr.us-east-1.amazonaws.com"` |  |
| gatekeeper.values.violations.allowedHostFilesystem.parameters.allowedHostPaths[0].pathPrefix | string | `"/var/lib/kubelet/pods"` |  |
| gatekeeper.values.violations.allowedHostFilesystem.parameters.allowedHostPaths[1].pathPrefix | string | `"/var/run/docker.sock"` |  |
| gatekeeper.values.violations.allowedHostFilesystem.parameters.allowedHostPaths[1].readOnly | bool | `false` |  |
| gatekeeper.values.violations.allowedHostFilesystem.parameters.allowedHostPaths[2].pathPrefix | string | `"/tmp"` |  |
| gatekeeper.values.violations.allowedHostFilesystem.parameters.allowedHostPaths[2].readOnly | bool | `false` |  |
| gatekeeper.values.violations.allowedHostFilesystem.parameters.excludedResources[0] | string | `"velero/*"` |  |
| gatekeeper.values.violations.volumeTypes.parameters.excludedResources[0] | string | `"velero/*"` |  |
| gatekeeper.values.violations.volumeTypes.parameters.excludedResources[1] | string | `"rapidfort/aggregator-.*"` |  |
| gatekeeper.values.violations.volumeTypes.parameters.excludedResources[2] | string | `"rapidfort/backend-.*"` |  |
| gatekeeper.values.violations.volumeTypes.parameters.excludedResources[3] | string | `"rapidfort/fileupload-.*"` |  |
| gatekeeper.values.violations.volumeTypes.parameters.excludedResources[4] | string | `"rapidfort/isomaster-.*"` |  |
| gatekeeper.values.violations.volumeTypes.parameters.excludedResources[5] | string | `"rapidfort/rfscan-.*"` |  |
| gatekeeper.values.violations.volumeTypes.parameters.excludedResources[6] | string | `"rapidfort/runner-.*"` |  |
| gatekeeper.values.violations.volumeTypes.parameters.excludedResources[7] | string | `"rapidfort/runnerbeat-.*"` |  |
| gatekeeper.values.violations.restrictedTaint.parameters.excludedResources[0] | string | `"monitoring/monitoring-monitoring-prometheus-node-exporter-.*"` |  |
| gatekeeper.values.violations.restrictedTaint.parameters.excludedResources[1] | string | `"twistlock/twistlock-defender-ds-.*"` |  |
| gatekeeper.values.violations.restrictedTaint.parameters.excludedResources[2] | string | `"logging/logging-fluent-bit-.*"` |  |
| gatekeeper.values.violations.noHostNamespace.parameters.excludedResources | string | `nil` |  |
| gatekeeper.values.violations.hostNetworking.parameters.excludedResources | string | `nil` |  |
| jaeger.enabled | bool | `false` |  |
| kiali.enabled | bool | `false` |  |
| clusterAuditor.enabled | bool | `false` |  |
| tempo.enabled | bool | `false` |  |
| promtail.enabled | bool | `false` |  |
| loki.enabled | bool | `false` |  |
| eckOperator.enabled | bool | `false` |  |
| elasticsearchKibana.enabled | bool | `false` |  |
| fluentbit.enabled | bool | `false` |  |
| monitoring.enabled | bool | `false` |  |
| grafana.enabled | bool | `false` |  |
| twistlock.enabled | bool | `false` |  |
| addons.argocd.enabled | bool | `false` |  |
| addons.authservice.enabled | bool | `false` |  |
| addons.gitlab.enabled | bool | `false` |  |
| addons.gitlabRunner.enabled | bool | `false` |  |
| addons.anchore.enabled | bool | `false` |  |
| addons.sonarqube.enabled | bool | `false` |  |
| addons.minioOperator.enabled | bool | `false` |  |
| addons.minio.enabled | bool | `false` |  |
| addons.mattermostoperator.enabled | bool | `false` |  |
| addons.mattermost.enabled | bool | `false` |  |
| addons.nexus.enabled | bool | `false` |  |
| addons.velero.enabled | bool | `false` |  |
| addons.keycloak.enabled | bool | `false` |  |
| addons.vault.enabled | bool | `false` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
# rapidfort

![Version: 1.2.4-bb.10](https://img.shields.io/badge/Version-1.2.4--bb.10-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.1.45](https://img.shields.io/badge/AppVersion-1.1.45-informational?style=flat-square)

Automated Container Hardening

## Learn More
* [Application Overview](docs/overview.md)
* [Other Documentation](docs/)

## Pre-Requisites

* Kubernetes Cluster deployed
* Kubernetes config installed in `~/.kube/config`
* Helm installed

Install Helm

https://helm.sh/docs/intro/install/

## Deployment

* Clone down the repository
* cd into directory
```bash
helm install rapidfort chart/
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.admin | string | `"admin@example.com"` |  |
| global.passwd | string | `"P@ssw0rd!"` |  |
| global.hostname | string | `"test.example.com"` |  |
| global.cloud | string | `"eks"` |  |
| global.type | string | `""` |  |
| global.communityservice.enabled | bool | `false` |  |
| global.imagePullSecrets[0].name | string | `"private-registry"` |  |
| global.ingress.enabled | bool | `false` |  |
| global.ingress.className | string | `"nginx"` |  |
| global.ingress.annotations | object | `{}` |  |
| global.ingress.tls | list | `[]` |  |
| global.aws.aws_access_key_id | string | `""` |  |
| global.aws.aws_secret_access_key | string | `""` |  |
| global.aws.region | string | `"us-east-1"` |  |
| global.aws.storage | string | `"rapidfort-bucket"` |  |
| serviceAccount.create | bool | `true` |  |
| storageClass.create | bool | `true` |  |
| storageClass.name | string | `"rf-storage-rw"` |  |
| db.auth.username | string | `"root"` |  |
| db.auth.password | string | `"RF-123579"` |  |
| db.auth.port | string | `"3306"` |  |
| db.auth.host | string | `"mysql"` |  |
| db.auth.db_name | string | `"standalone"` |  |
| db.ssl.enabled | bool | `false` |  |
| db.ssl.secretName | string | `"rapidfort-db-connection-certs"` |  |
| db.ssl.certFile | string | `""` |  |
| aggregator.enabled | bool | `true` |  |
| aggregator.replicaCount | int | `1` |  |
| aggregator.image | string | `"registry1.dso.mil/ironbank/rapidfort/aggregator-exe:1.1.45-rfhardened"` |  |
| aggregator.ports | object | `{}` |  |
| aggregator.ephemeralVolumeClaimTemplates[0].name | string | `"aggregator-data"` |  |
| aggregator.ephemeralVolumeClaimTemplates[0].accessMode | string | `"ReadWriteOnce"` |  |
| aggregator.ephemeralVolumeClaimTemplates[0].storageClassName | string | `"{{ .Values.storageClass.name }}"` |  |
| aggregator.ephemeralVolumeClaimTemplates[0].size | string | `"256Gi"` |  |
| aggregator.ephemeralVolumeClaimTemplates[1].name | string | `"aggregator-data-local-bucket"` |  |
| aggregator.ephemeralVolumeClaimTemplates[1].accessMode | string | `"ReadWriteOnce"` |  |
| aggregator.ephemeralVolumeClaimTemplates[1].storageClassName | string | `"{{ .Values.storageClass.name }}"` |  |
| aggregator.ephemeralVolumeClaimTemplates[1].size | string | `"256Gi"` |  |
| aggregator.volumes | list | `[]` |  |
| aggregator.volumeMounts[0].name | string | `"aggregator-data"` |  |
| aggregator.volumeMounts[0].mountPath | string | `"/mnt/raid/aggregator"` |  |
| aggregator.volumeMounts[1].name | string | `"aggregator-data-local-bucket"` |  |
| aggregator.volumeMounts[1].mountPath | string | `"/opt/rapidfort/local-bucket"` |  |
| aggregator.initContainers | list | `[]` |  |
| aggregator.podSecurityContext.fsGroup | int | `1000` |  |
| aggregator.containerSecurityContext | object | `{}` |  |
| aggregator.service | object | `{}` |  |
| aggregator.ingress | object | `{}` |  |
| aggregator.resources.limits.cpu | string | `"2000m"` |  |
| aggregator.resources.limits.memory | string | `"4096Mi"` |  |
| aggregator.resources.requests.cpu | string | `"500m"` |  |
| aggregator.resources.requests.memory | string | `"512Mi"` |  |
| aggregator.envVars.RF_API_SERVER | string | `"iso-master"` |  |
| aggregator.envVars.RF_DEBUG | string | `"no"` |  |
| aggregator.envVarsSecret[0] | string | `"RF_S3_BUCKET"` |  |
| aggregator.envVarsSecret[1] | string | `"RF_STORAGE_TYPE"` |  |
| aggregator.envVarsSecret[2] | string | `"AWS_ACCESS_KEY_ID"` |  |
| aggregator.envVarsSecret[3] | string | `"AWS_DEFAULT_REGION"` |  |
| aggregator.envVarsSecret[4] | string | `"AWS_SECRET_ACCESS_KEY"` |  |
| aggregator.envVarsSecret[5] | string | `"RF_GS_CREDS"` |  |
| aggregator.envVarsSecret[6] | string | `"RF_ROLE_ARN"` |  |
| aggregator.envVarsSecret[7] | string | `"RF_APP_HOST"` |  |
| aggregator.envVarsSecret[8] | string | `"DEPLOY_MODE"` |  |
| aggregator.envVarsSecret[9] | string | `"RF_VERBOSE"` |  |
| aggregator.envVarsSecret[10] | string | `"RF_AZURE_CONNECTION_STRING"` |  |
| aggregator.startupProbe | object | `{}` |  |
| aggregator.livenessProbe | object | `{}` |  |
| aggregator.readinessProbe | object | `{}` |  |
| backend.enabled | bool | `true` |  |
| backend.replicaCount | int | `1` |  |
| backend.image | string | `"registry1.dso.mil/ironbank/rapidfort/backend-exe:1.1.45-rfhardened"` |  |
| backend.ports[0].name | string | `"http"` |  |
| backend.ports[0].containerPort | int | `8080` |  |
| backend.ephemeralVolumeClaimTemplates[0].name | string | `"backend-data"` |  |
| backend.ephemeralVolumeClaimTemplates[0].accessMode | string | `"ReadWriteOnce"` |  |
| backend.ephemeralVolumeClaimTemplates[0].storageClassName | string | `"{{ .Values.storageClass.name }}"` |  |
| backend.ephemeralVolumeClaimTemplates[0].size | string | `"128Gi"` |  |
| backend.volumes | list | `[]` |  |
| backend.volumeMounts[0].name | string | `"backend-data"` |  |
| backend.volumeMounts[0].mountPath | string | `"/opt/rapidfort/local-bucket"` |  |
| backend.initContainers | list | `[]` |  |
| backend.podSecurityContext | object | `{}` |  |
| backend.containerSecurityContext | object | `{}` |  |
| backend.service.type | string | `"ClusterIP"` |  |
| backend.service.port | int | `80` |  |
| backend.service.targetPort | int | `8080` |  |
| backend.ingress.className | string | `""` |  |
| backend.ingress.annotations."nginx.ingress.kubernetes.io/proxy-read-timeout" | string | `"3600"` |  |
| backend.ingress.annotations."nginx.ingress.kubernetes.io/server-snippet" | string | `"gzip on;\ngzip_disable \"MSIE [1-6]\\.(?!.*SV1)\"\ngzip_vary on;\ngzip_proxied any;\ngzip_comp_level 5;\ngzip_min_length 512;\ngzip_buffers 16 128k;\ngzip_http_version 1.0;\ngzip_types application/json;\n"` |  |
| backend.ingress.hosts[0].host | string | `nil` |  |
| backend.ingress.hosts[0].paths[0].path | string | `"/api/v1/"` |  |
| backend.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| backend.resources.limits.cpu | string | `"2000m"` |  |
| backend.resources.limits.memory | string | `"4096Mi"` |  |
| backend.resources.requests.cpu | string | `"500m"` |  |
| backend.resources.requests.memory | string | `"512Mi"` |  |
| backend.envVars.AUTH_SERVER_ROOT_URL | string | `"http://keycloak"` |  |
| backend.envVars.LC_ALL | string | `"en_US.UTF-8"` |  |
| backend.envVars.QUAY_ENABLED_RF_APP_HOST | string | `"preprod.azure.rapidfort.io us01.rapidfort.com"` |  |
| backend.envVarsSecret[0] | string | `"RF_APP_HOST"` |  |
| backend.envVarsSecret[1] | string | `"DB_URL"` |  |
| backend.envVarsSecret[2] | string | `"DEPLOY_MODE"` |  |
| backend.envVarsSecret[3] | string | `"RF_VERBOSE"` |  |
| backend.envVarsSecret[4] | string | `"RF_APP_ADMIN"` |  |
| backend.envVarsSecret[5] | string | `"RF_APP_ADMIN_PASSWD"` |  |
| backend.envVarsSecret[6] | string | `"RF_STORAGE_TYPE"` |  |
| backend.envVarsSecret[7] | string | `"RF_S3_BUCKET"` |  |
| backend.envVarsSecret[8] | string | `"AWS_ACCESS_KEY_ID"` |  |
| backend.envVarsSecret[9] | string | `"AWS_DEFAULT_REGION"` |  |
| backend.envVarsSecret[10] | string | `"AWS_SECRET_ACCESS_KEY"` |  |
| backend.envVarsSecret[11] | string | `"RF_ROLE_ARN"` |  |
| backend.envVarsSecret[12] | string | `"RF_GS_CREDS"` |  |
| backend.envVarsSecret[13] | string | `"RF_AZURE_CONNECTION_STRING"` |  |
| backend.envVarsSecret[14] | string | `"KEYCLOAK_JWT_PUB_KEY"` |  |
| backend.envVarsSecret[15] | string | `"KEYCLOAK_CLIENT_ID"` |  |
| backend.envVarsSecret[16] | string | `"KEYCLOAK_REALM"` |  |
| backend.envVarsSecret[17] | string | `"KEYCLOAK_SERVICE_ACCOUNT_CLIENT_ID"` |  |
| backend.envVarsSecret[18] | string | `"KEYCLOAK_SERVICE_ACCOUNT_CLIENT_SECRET"` |  |
| backend.envVarsSecret[19] | string | `"QUAY_TOKEN"` |  |
| backend.startupProbe | object | `{}` |  |
| backend.livenessProbe.httpGet.path | string | `"/"` |  |
| backend.livenessProbe.httpGet.port | int | `8080` |  |
| backend.livenessProbe.failureThreshold | int | `10` |  |
| backend.readinessProbe.httpGet.path | string | `"/"` |  |
| backend.readinessProbe.httpGet.port | int | `8080` |  |
| backend.readinessProbe.failureThreshold | int | `10` |  |
| filesredis.enabled | bool | `true` |  |
| filesredis.replicaCount | int | `1` |  |
| filesredis.image | string | `"registry1.dso.mil/ironbank/bitnami/redis:7.2.4"` |  |
| filesredis.ports[0].containerPort | int | `6379` |  |
| filesredis.ports[0].name | string | `"redis"` |  |
| filesredis.volumeClaimTemplates[0].name | string | `"redis-data"` |  |
| filesredis.volumeClaimTemplates[0].accessMode | string | `"ReadWriteOnce"` |  |
| filesredis.volumeClaimTemplates[0].storageClassName | string | `"{{ .Values.storageClass.name }}"` |  |
| filesredis.volumeClaimTemplates[0].size | string | `"256Gi"` |  |
| filesredis.volumeMounts[0].name | string | `"redis-data"` |  |
| filesredis.volumeMounts[0].mountPath | string | `"/bitnami/redis/data"` |  |
| filesredis.initContainers[0].name | string | `"disk-init"` |  |
| filesredis.initContainers[0].image | string | `"registry1.dso.mil/ironbank/redhat/ubi/ubi8-minimal:8.9"` |  |
| filesredis.initContainers[0].command[0] | string | `"chown"` |  |
| filesredis.initContainers[0].command[1] | string | `"1001"` |  |
| filesredis.initContainers[0].command[2] | string | `"/opt/rapidfort/local-bucket/data/files-redis"` |  |
| filesredis.initContainers[0].volumeMounts[0].name | string | `"redis-data"` |  |
| filesredis.initContainers[0].volumeMounts[0].mountPath | string | `"/opt/rapidfort/local-bucket/data/files-redis"` |  |
| filesredis.podSecurityContext | object | `{}` |  |
| filesredis.containerSecurityContext | object | `{}` |  |
| filesredis.service.type | string | `"ClusterIP"` |  |
| filesredis.service.port | int | `6379` |  |
| filesredis.ingress | object | `{}` |  |
| filesredis.resources.limits.cpu | string | `"2"` |  |
| filesredis.resources.limits.memory | string | `"6144Mi"` |  |
| filesredis.resources.requests.cpu | string | `"1"` |  |
| filesredis.resources.requests.memory | string | `"2048Mi"` |  |
| filesredis.envVars.ALLOW_EMPTY_PASSWORD | string | `"yes"` |  |
| filesredis.envVars.REDIS_AOF_ENABLED | string | `"no"` |  |
| filesredis.envVarsSecret | object | `{}` |  |
| filesredis.startupProbe | object | `{}` |  |
| filesredis.livenessProbe.exec.command[0] | string | `"redis-cli"` |  |
| filesredis.livenessProbe.exec.command[1] | string | `"ping"` |  |
| filesredis.livenessProbe.failureThreshold | int | `10` |  |
| filesredis.readinessProbe.exec.command[0] | string | `"redis-cli"` |  |
| filesredis.readinessProbe.exec.command[1] | string | `"ping"` |  |
| filesredis.readinessProbe.failureThreshold | int | `10` |  |
| fileupload.enabled | bool | `true` |  |
| fileupload.replicaCount | int | `1` |  |
| fileupload.image | string | `"registry1.dso.mil/ironbank/rapidfort/fileupload:1.1.45-rfhardened"` |  |
| fileupload.ports[0].name | string | `"http"` |  |
| fileupload.ports[0].containerPort | int | `8080` |  |
| fileupload.ephemeralVolumeClaimTemplates[0].name | string | `"fileupload-data"` |  |
| fileupload.ephemeralVolumeClaimTemplates[0].accessMode | string | `"ReadWriteOnce"` |  |
| fileupload.ephemeralVolumeClaimTemplates[0].storageClassName | string | `"{{ .Values.storageClass.name }}"` |  |
| fileupload.ephemeralVolumeClaimTemplates[0].size | string | `"256Gi"` |  |
| fileupload.volumes | list | `[]` |  |
| fileupload.volumeMounts[0].name | string | `"fileupload-data"` |  |
| fileupload.volumeMounts[0].mountPath | string | `"/opt/rapidfort/local-bucket"` |  |
| fileupload.podSecurityContext | object | `{}` |  |
| fileupload.containerSecurityContext | object | `{}` |  |
| fileupload.service.type | string | `"ClusterIP"` |  |
| fileupload.service.port | int | `80` |  |
| fileupload.service.targetPort | int | `8080` |  |
| fileupload.ingress.className | string | `""` |  |
| fileupload.ingress.annotations."nginx.ingress.kubernetes.io/proxy-read-timeout" | string | `"3600"` |  |
| fileupload.ingress.annotations."nginx.ingress.kubernetes.io/proxy-buffering" | string | `"off"` |  |
| fileupload.ingress.annotations."nginx.ingress.kubernetes.io/proxy-body-size" | string | `"10240m"` |  |
| fileupload.ingress.annotations."nginx.ingress.kubernetes.io/proxy-request-buffering" | string | `"off"` |  |
| fileupload.ingress.hosts[0].host | string | `nil` |  |
| fileupload.ingress.hosts[0].paths[0].path | string | `"/upload"` |  |
| fileupload.ingress.hosts[0].paths[0].pathType | string | `"Exact"` |  |
| fileupload.ingress.hosts[0].paths[1].path | string | `"/download"` |  |
| fileupload.ingress.hosts[0].paths[1].pathType | string | `"Prefix"` |  |
| fileupload.resources | object | `{}` |  |
| fileupload.envVars | object | `{}` |  |
| fileupload.envVarsSecret[0] | string | `"DB_URL"` |  |
| fileupload.envVarsSecret[1] | string | `"RF_S3_BUCKET"` |  |
| fileupload.envVarsSecret[2] | string | `"RF_STORAGE_TYPE"` |  |
| fileupload.envVarsSecret[3] | string | `"KEYCLOAK_JWT_PUB_KEY"` |  |
| fileupload.envVarsSecret[4] | string | `"KEYCLOAK_CLIENT_ID"` |  |
| fileupload.envVarsSecret[5] | string | `"KEYCLOAK_REALM"` |  |
| fileupload.envVarsSecret[6] | string | `"KEYCLOAK_SERVICE_ACCOUNT_CLIENT_ID"` |  |
| fileupload.envVarsSecret[7] | string | `"KEYCLOAK_SERVICE_ACCOUNT_CLIENT_SECRET"` |  |
| fileupload.envVarsSecret[8] | string | `"AWS_DEFAULT_REGION"` |  |
| fileupload.envVarsSecret[9] | string | `"AWS_ACCESS_KEY_ID"` |  |
| fileupload.envVarsSecret[10] | string | `"RF_ROLE_ARN"` |  |
| fileupload.envVarsSecret[11] | string | `"RF_GS_CREDS"` |  |
| fileupload.envVarsSecret[12] | string | `"RF_AZURE_CONNECTION_STRING"` |  |
| fileupload.envVarsSecret[13] | string | `"AWS_SECRET_ACCESS_KEY"` |  |
| fileupload.envVarsSecret[14] | string | `"RF_VERBOSE"` |  |
| fileupload.startupProbe | object | `{}` |  |
| fileupload.livenessProbe.httpGet.path | string | `"/"` |  |
| fileupload.livenessProbe.httpGet.port | int | `8080` |  |
| fileupload.livenessProbe.failureThreshold | int | `99` |  |
| fileupload.readinessProbe.httpGet.path | string | `"/"` |  |
| fileupload.readinessProbe.httpGet.port | int | `8080` |  |
| fileupload.readinessProbe.failureThreshold | int | `99` |  |
| frontrow.enabled | bool | `true` |  |
| frontrow.replicaCount | int | `1` |  |
| frontrow.image | string | `"registry1.dso.mil/ironbank/rapidfort/frontrow:1.1.45-rfhardened"` |  |
| frontrow.ports[0].name | string | `"http"` |  |
| frontrow.ports[0].containerPort | int | `8080` |  |
| frontrow.volumes | object | `{}` |  |
| frontrow.volumeMounts | object | `{}` |  |
| frontrow.initContainers | object | `{}` |  |
| frontrow.podSecurityContext | object | `{}` |  |
| frontrow.containerSecurityContext | object | `{}` |  |
| frontrow.service.type | string | `"ClusterIP"` |  |
| frontrow.service.port | int | `80` |  |
| frontrow.service.targetPort | int | `8080` |  |
| frontrow.ingress.className | string | `""` |  |
| frontrow.ingress.annotations."nginx.ingress.kubernetes.io/ssl-redirect" | string | `"true"` |  |
| frontrow.ingress.annotations."nginx.ingress.kubernetes.io/force-ssl-redirect" | string | `"true"` |  |
| frontrow.ingress.hosts[0].host | string | `nil` |  |
| frontrow.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| frontrow.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| frontrow.ingress.hosts[0].paths[1].path | string | `"/cli"` |  |
| frontrow.ingress.hosts[0].paths[1].pathType | string | `"Prefix"` |  |
| frontrow.resources | object | `{}` |  |
| frontrow.envVars | object | `{}` |  |
| frontrow.envVarsSecret[0] | string | `"RF_APP_HOST"` |  |
| frontrow.envVarsSecret[1] | string | `"DEPLOY_MODE"` |  |
| frontrow.startupProbe | object | `{}` |  |
| frontrow.livenessProbe.httpGet.path | string | `"/"` |  |
| frontrow.livenessProbe.httpGet.port | int | `8080` |  |
| frontrow.livenessProbe.failureThreshold | int | `10` |  |
| frontrow.readinessProbe.httpGet.path | string | `"/"` |  |
| frontrow.readinessProbe.httpGet.port | int | `8080` |  |
| frontrow.readinessProbe.failureThreshold | int | `10` |  |
| isomaster.enabled | bool | `true` |  |
| isomaster.replicaCount | int | `1` |  |
| isomaster.image | string | `"registry1.dso.mil/ironbank/rapidfort/iso-master-exe:1.1.45-rfhardened"` |  |
| isomaster.ports[0].name | string | `"http"` |  |
| isomaster.ports[0].containerPort | int | `8080` |  |
| isomaster.ephemeralVolumeClaimTemplates[0].name | string | `"imgs-work-dir"` |  |
| isomaster.ephemeralVolumeClaimTemplates[0].accessMode | string | `"ReadWriteOnce"` |  |
| isomaster.ephemeralVolumeClaimTemplates[0].storageClassName | string | `"{{ .Values.storageClass.name }}"` |  |
| isomaster.ephemeralVolumeClaimTemplates[0].size | string | `"256Gi"` |  |
| isomaster.volumes | list | `[]` |  |
| isomaster.volumeMounts[0].name | string | `"imgs-work-dir"` |  |
| isomaster.volumeMounts[0].mountPath | string | `"/opt/rapidfort/local-bucket"` |  |
| isomaster.initContainers | list | `[]` |  |
| isomaster.serviceAccount | object | `{}` |  |
| isomaster.podSecurityContext | object | `{}` |  |
| isomaster.containerSecurityContext | object | `{}` |  |
| isomaster.service.type | string | `"ClusterIP"` |  |
| isomaster.service.port | int | `80` |  |
| isomaster.service.targetPort | int | `8080` |  |
| isomaster.ingress.className | string | `""` |  |
| isomaster.ingress.annotations."nginx.ingress.kubernetes.io/proxy-read-timeout" | string | `"3600"` |  |
| isomaster.ingress.hosts[0].host | string | `nil` |  |
| isomaster.ingress.hosts[0].paths[0].path | string | `"/iso-master/"` |  |
| isomaster.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| isomaster.resources | object | `{}` |  |
| isomaster.envVars.LC_ALL | string | `"en_US.UTF-8"` |  |
| isomaster.envVarsSecret[0] | string | `"DB_URL"` |  |
| isomaster.envVarsSecret[1] | string | `"AWS_DEFAULT_REGION"` |  |
| isomaster.envVarsSecret[2] | string | `"RF_S3_BUCKET"` |  |
| isomaster.envVarsSecret[3] | string | `"RF_STORAGE_TYPE"` |  |
| isomaster.envVarsSecret[4] | string | `"AWS_ACCESS_KEY_ID"` |  |
| isomaster.envVarsSecret[5] | string | `"AWS_SECRET_ACCESS_KEY"` |  |
| isomaster.envVarsSecret[6] | string | `"RF_ROLE_ARN"` |  |
| isomaster.envVarsSecret[7] | string | `"RF_GS_CREDS"` |  |
| isomaster.envVarsSecret[8] | string | `"RF_AZURE_CONNECTION_STRING"` |  |
| isomaster.envVarsSecret[9] | string | `"RF_APP_HOST"` |  |
| isomaster.envVarsSecret[10] | string | `"DEPLOY_MODE"` |  |
| isomaster.envVarsSecret[11] | string | `"RF_VERBOSE"` |  |
| isomaster.envVarsSecret[12] | string | `"KEYCLOAK_JWT_PUB_KEY"` |  |
| isomaster.envVarsSecret[13] | string | `"KEYCLOAK_CLIENT_ID"` |  |
| isomaster.envVarsSecret[14] | string | `"KEYCLOAK_REALM"` |  |
| isomaster.envVarsSecret[15] | string | `"KEYCLOAK_SERVICE_ACCOUNT_CLIENT_ID"` |  |
| isomaster.envVarsSecret[16] | string | `"KEYCLOAK_SERVICE_ACCOUNT_CLIENT_SECRET"` |  |
| isomaster.startupProbe | object | `{}` |  |
| isomaster.livenessProbe.httpGet.path | string | `"/"` |  |
| isomaster.livenessProbe.httpGet.port | int | `8080` |  |
| isomaster.livenessProbe.failureThreshold | int | `10` |  |
| isomaster.readinessProbe.httpGet.path | string | `"/"` |  |
| isomaster.readinessProbe.httpGet.port | int | `8080` |  |
| isomaster.readinessProbe.failureThreshold | int | `10` |  |
| keycloak.enabled | bool | `true` |  |
| keycloak.replicaCount | int | `1` |  |
| keycloak.image | string | `"registry1.dso.mil/ironbank/rapidfort/keycloak:24.0.1"` |  |
| keycloak.ports[0].name | string | `"http"` |  |
| keycloak.ports[0].containerPort | int | `8080` |  |
| keycloak.volumes | object | `{}` |  |
| keycloak.volumeMounts | object | `{}` |  |
| keycloak.podSecurityContext | object | `{}` |  |
| keycloak.containerSecurityContext | object | `{}` |  |
| keycloak.service.type | string | `"ClusterIP"` |  |
| keycloak.service.port | int | `80` |  |
| keycloak.service.targetPort | int | `8080` |  |
| keycloak.ingress.enabled | bool | `false` |  |
| keycloak.ingress.className | string | `""` |  |
| keycloak.ingress.annotations | string | `nil` |  |
| keycloak.ingress.hosts[0].host | string | `nil` |  |
| keycloak.ingress.hosts[0].paths[0].path | string | `"/auth/"` |  |
| keycloak.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| keycloak.resources | object | `{}` |  |
| keycloak.envVars | object | `{}` |  |
| keycloak.envVarsSecret[0] | string | `"KC_DB_URL"` |  |
| keycloak.startupProbe | object | `{}` |  |
| keycloak.livenessProbe.httpGet.path | string | `"/auth/health/live"` |  |
| keycloak.livenessProbe.httpGet.port | int | `8080` |  |
| keycloak.livenessProbe.failureThreshold | int | `99` |  |
| keycloak.readinessProbe.httpGet.path | string | `"/auth/health/ready"` |  |
| keycloak.readinessProbe.httpGet.port | int | `8080` |  |
| keycloak.readinessProbe.failureThreshold | int | `99` |  |
| lockredis.enabled | bool | `true` |  |
| lockredis.replicaCount | int | `1` |  |
| lockredis.image | string | `"registry1.dso.mil/ironbank/bitnami/redis:7.2.4"` |  |
| lockredis.ports[0].containerPort | int | `6379` |  |
| lockredis.ports[0].name | string | `"redis"` |  |
| lockredis.volumeClaimTemplates[0].name | string | `"redis-data"` |  |
| lockredis.volumeClaimTemplates[0].accessMode | string | `"ReadWriteOnce"` |  |
| lockredis.volumeClaimTemplates[0].storageClassName | string | `"{{ .Values.storageClass.name }}"` |  |
| lockredis.volumeClaimTemplates[0].size | string | `"64Gi"` |  |
| lockredis.volumeMounts[0].name | string | `"redis-data"` |  |
| lockredis.volumeMounts[0].mountPath | string | `"/bitnami/redis/data"` |  |
| lockredis.initContainers[0].name | string | `"disk-init"` |  |
| lockredis.initContainers[0].image | string | `"registry1.dso.mil/ironbank/redhat/ubi/ubi8-minimal:8.9"` |  |
| lockredis.initContainers[0].command[0] | string | `"chown"` |  |
| lockredis.initContainers[0].command[1] | string | `"1001"` |  |
| lockredis.initContainers[0].command[2] | string | `"/opt/rapidfort/local-bucket/data/lock-redis"` |  |
| lockredis.initContainers[0].volumeMounts[0].name | string | `"redis-data"` |  |
| lockredis.initContainers[0].volumeMounts[0].mountPath | string | `"/opt/rapidfort/local-bucket/data/lock-redis"` |  |
| lockredis.podSecurityContext | object | `{}` |  |
| lockredis.containerSecurityContext | object | `{}` |  |
| lockredis.service.type | string | `"ClusterIP"` |  |
| lockredis.service.port | int | `6379` |  |
| lockredis.ingress | object | `{}` |  |
| lockredis.resources | object | `{}` |  |
| lockredis.envVars.ALLOW_EMPTY_PASSWORD | string | `"yes"` |  |
| lockredis.envVars.REDIS_AOF_ENABLED | string | `"no"` |  |
| lockredis.envVarsSecret | object | `{}` |  |
| lockredis.startupProbe | object | `{}` |  |
| lockredis.livenessProbe.exec.command[0] | string | `"redis-cli"` |  |
| lockredis.livenessProbe.exec.command[1] | string | `"ping"` |  |
| lockredis.livenessProbe.failureThreshold | int | `10` |  |
| lockredis.readinessProbe.exec.command[0] | string | `"redis-cli"` |  |
| lockredis.readinessProbe.exec.command[1] | string | `"ping"` |  |
| lockredis.readinessProbe.failureThreshold | int | `10` |  |
| mysql.enabled | bool | `true` |  |
| mysql.replicaCount | int | `1` |  |
| mysql.image | string | `"registry1.dso.mil/ironbank/bitnami/mysql8:8.0.29-debian-10-r37"` |  |
| mysql.ports[0].name | string | `"mysql"` |  |
| mysql.ports[0].containerPort | int | `3306` |  |
| mysql.volumes[0].name | string | `"mysql-initdb"` |  |
| mysql.volumes[0].configMap.name | string | `"mysql-initdb-config"` |  |
| mysql.volumeMounts[0].name | string | `"mysql-data"` |  |
| mysql.volumeMounts[0].mountPath | string | `"/bitnami/mysql/data"` |  |
| mysql.volumeMounts[1].name | string | `"mysql-initdb"` |  |
| mysql.volumeMounts[1].mountPath | string | `"/docker-entrypoint-initdb.d"` |  |
| mysql.volumeClaimTemplates[0].name | string | `"mysql-data"` |  |
| mysql.volumeClaimTemplates[0].accessMode | string | `"ReadWriteOnce"` |  |
| mysql.volumeClaimTemplates[0].storageClassName | string | `"{{ .Values.storageClass.name }}"` |  |
| mysql.volumeClaimTemplates[0].size | string | `"256Gi"` |  |
| mysql.initContainers[0].name | string | `"disk-init"` |  |
| mysql.initContainers[0].image | string | `"registry1.dso.mil/ironbank/redhat/ubi/ubi8-minimal:8.9"` |  |
| mysql.initContainers[0].command[0] | string | `"chown"` |  |
| mysql.initContainers[0].command[1] | string | `"1001"` |  |
| mysql.initContainers[0].command[2] | string | `"/opt/rapidfort/local-bucket/data/mysql"` |  |
| mysql.initContainers[0].volumeMounts[0].name | string | `"mysql-data"` |  |
| mysql.initContainers[0].volumeMounts[0].mountPath | string | `"/opt/rapidfort/local-bucket/data/mysql"` |  |
| mysql.podSecurityContext | object | `{}` |  |
| mysql.containerSecurityContext | object | `{}` |  |
| mysql.ingress | object | `{}` |  |
| mysql.resources | object | `{}` |  |
| mysql.envVars.MYSQL_DATABASE | string | `"keycloak"` |  |
| mysql.envVars.MYSQL_AUTHENTICATION_PLUGIN | string | `"mysql_native_password"` |  |
| mysql.envVarsSecret | object | `{}` |  |
| mysql.startupProbe | object | `{}` |  |
| mysql.livenessProbe.exec.command[0] | string | `"mysql"` |  |
| mysql.livenessProbe.exec.command[1] | string | `"-h"` |  |
| mysql.livenessProbe.exec.command[2] | string | `"localhost"` |  |
| mysql.livenessProbe.exec.command[3] | string | `"-u"` |  |
| mysql.livenessProbe.exec.command[4] | string | `"{{ .Values.db.auth.username }}"` |  |
| mysql.livenessProbe.exec.command[5] | string | `"-p{{ .Values.db.auth.password }}"` |  |
| mysql.livenessProbe.exec.command[6] | string | `"-e"` |  |
| mysql.livenessProbe.exec.command[7] | string | `"SHOW DATABASES;"` |  |
| mysql.livenessProbe.failureThreshold | int | `10` |  |
| mysql.readinessProbe.exec.command[0] | string | `"mysql"` |  |
| mysql.readinessProbe.exec.command[1] | string | `"-h"` |  |
| mysql.readinessProbe.exec.command[2] | string | `"localhost"` |  |
| mysql.readinessProbe.exec.command[3] | string | `"-u"` |  |
| mysql.readinessProbe.exec.command[4] | string | `"{{ .Values.db.auth.username }}"` |  |
| mysql.readinessProbe.exec.command[5] | string | `"-p{{ .Values.db.auth.password }}"` |  |
| mysql.readinessProbe.exec.command[6] | string | `"-e"` |  |
| mysql.readinessProbe.exec.command[7] | string | `"SHOW DATABASES;"` |  |
| mysql.readinessProbe.failureThreshold | int | `10` |  |
| redis.enabled | bool | `true` |  |
| redis.replicaCount | int | `1` |  |
| redis.image | string | `"registry1.dso.mil/ironbank/bitnami/redis:7.2.4"` |  |
| redis.ports[0].containerPort | int | `6379` |  |
| redis.ports[0].name | string | `"redis"` |  |
| redis.volumeMounts[0].name | string | `"redis-data"` |  |
| redis.volumeMounts[0].mountPath | string | `"/bitnami/redis/data"` |  |
| redis.volumeClaimTemplates[0].name | string | `"redis-data"` |  |
| redis.volumeClaimTemplates[0].accessMode | string | `"ReadWriteOnce"` |  |
| redis.volumeClaimTemplates[0].storageClassName | string | `"{{ .Values.storageClass.name }}"` |  |
| redis.volumeClaimTemplates[0].size | string | `"128Gi"` |  |
| redis.initContainers[0].name | string | `"disk-init"` |  |
| redis.initContainers[0].image | string | `"registry1.dso.mil/ironbank/redhat/ubi/ubi8-minimal:8.9"` |  |
| redis.initContainers[0].command[0] | string | `"chown"` |  |
| redis.initContainers[0].command[1] | string | `"1001"` |  |
| redis.initContainers[0].command[2] | string | `"/opt/rapidfort/local-bucket/data/redis"` |  |
| redis.initContainers[0].volumeMounts[0].name | string | `"redis-data"` |  |
| redis.initContainers[0].volumeMounts[0].mountPath | string | `"/opt/rapidfort/local-bucket/data/redis"` |  |
| redis.podSecurityContext | object | `{}` |  |
| redis.containerSecurityContext | object | `{}` |  |
| redis.service.type | string | `"ClusterIP"` |  |
| redis.service.port | int | `6379` |  |
| redis.ingress | object | `{}` |  |
| redis.resources.limits.cpu | string | `"2"` |  |
| redis.resources.limits.memory | string | `"6144Mi"` |  |
| redis.resources.requests.cpu | string | `"1"` |  |
| redis.resources.requests.memory | string | `"2048Mi"` |  |
| redis.envVars.ALLOW_EMPTY_PASSWORD | string | `"yes"` |  |
| redis.envVars.REDIS_AOF_ENABLED | string | `"no"` |  |
| redis.envVarsSecret | object | `{}` |  |
| redis.startupProbe | object | `{}` |  |
| redis.livenessProbe.exec.command[0] | string | `"redis-cli"` |  |
| redis.livenessProbe.exec.command[1] | string | `"ping"` |  |
| redis.livenessProbe.failureThreshold | int | `10` |  |
| redis.readinessProbe.exec.command[0] | string | `"redis-cli"` |  |
| redis.readinessProbe.exec.command[1] | string | `"ping"` |  |
| redis.readinessProbe.failureThreshold | int | `10` |  |
| rfscan.enabled | bool | `true` |  |
| rfscan.replicaCount | int | `1` |  |
| rfscan.image | string | `"registry1.dso.mil/ironbank/rapidfort/rf-scan-exe:1.1.45-rfhardened"` |  |
| rfscan.ports[0].name | string | `"http"` |  |
| rfscan.ports[0].containerPort | int | `8080` |  |
| rfscan.ephemeralVolumeClaimTemplates[0].name | string | `"imgs-work-dir"` |  |
| rfscan.ephemeralVolumeClaimTemplates[0].accessMode | string | `"ReadWriteOnce"` |  |
| rfscan.ephemeralVolumeClaimTemplates[0].storageClassName | string | `"{{ .Values.storageClass.name }}"` |  |
| rfscan.ephemeralVolumeClaimTemplates[0].size | string | `"256Gi"` |  |
| rfscan.volumes | list | `[]` |  |
| rfscan.volumeMounts[0].name | string | `"imgs-work-dir"` |  |
| rfscan.volumeMounts[0].mountPath | string | `"/opt/rapidfort/local-bucket"` |  |
| rfscan.initContainers | list | `[]` |  |
| rfscan.serviceAccount | object | `{}` |  |
| rfscan.podSecurityContext | object | `{}` |  |
| rfscan.containerSecurityContext | object | `{}` |  |
| rfscan.service.type | string | `"ClusterIP"` |  |
| rfscan.service.port | int | `80` |  |
| rfscan.service.targetPort | int | `8080` |  |
| rfscan.ingress.className | string | `""` |  |
| rfscan.ingress.annotations."nginx.ingress.kubernetes.io/proxy-read-timeout" | string | `"3600"` |  |
| rfscan.ingress.hosts[0].host | string | `nil` |  |
| rfscan.ingress.hosts[0].paths[0].path | string | `"/rf-scan/"` |  |
| rfscan.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| rfscan.resources | object | `{}` |  |
| rfscan.envVars.LC_ALL | string | `"en_US.UTF-8"` |  |
| rfscan.envVarsSecret[0] | string | `"AWS_DEFAULT_REGION"` |  |
| rfscan.envVarsSecret[1] | string | `"DB_URL"` |  |
| rfscan.envVarsSecret[2] | string | `"RF_S3_BUCKET"` |  |
| rfscan.envVarsSecret[3] | string | `"RF_STORAGE_TYPE"` |  |
| rfscan.envVarsSecret[4] | string | `"AWS_ACCESS_KEY_ID"` |  |
| rfscan.envVarsSecret[5] | string | `"AWS_SECRET_ACCESS_KEY"` |  |
| rfscan.envVarsSecret[6] | string | `"RF_ROLE_ARN"` |  |
| rfscan.envVarsSecret[7] | string | `"RF_GS_CREDS"` |  |
| rfscan.envVarsSecret[8] | string | `"KEYCLOAK_JWT_PUB_KEY"` |  |
| rfscan.envVarsSecret[9] | string | `"KEYCLOAK_REALM"` |  |
| rfscan.envVarsSecret[10] | string | `"KEYCLOAK_CLIENT_ID"` |  |
| rfscan.envVarsSecret[11] | string | `"KEYCLOAK_SERVICE_ACCOUNT_CLIENT_ID"` |  |
| rfscan.envVarsSecret[12] | string | `"KEYCLOAK_SERVICE_ACCOUNT_CLIENT_SECRET"` |  |
| rfscan.envVarsSecret[13] | string | `"RF_APP_HOST"` |  |
| rfscan.envVarsSecret[14] | string | `"DEPLOY_MODE"` |  |
| rfscan.envVarsSecret[15] | string | `"RF_VERBOSE"` |  |
| rfscan.envVarsSecret[16] | string | `"RF_AZURE_CONNECTION_STRING"` |  |
| rfscan.startupProbe | object | `{}` |  |
| rfscan.livenessProbe.httpGet.path | string | `"/"` |  |
| rfscan.livenessProbe.httpGet.port | int | `8080` |  |
| rfscan.livenessProbe.failureThreshold | int | `10` |  |
| rfscan.readinessProbe.httpGet.path | string | `"/"` |  |
| rfscan.readinessProbe.httpGet.port | int | `8080` |  |
| rfscan.readinessProbe.failureThreshold | int | `10` |  |
| rfapi.enabled | bool | `true` |  |
| rfapi.replicaCount | int | `1` |  |
| rfapi.image | string | `"registry1.dso.mil/ironbank/rapidfort/rfapi-exe:1.1.45-rfhardened"` |  |
| rfapi.ports[0].name | string | `"http"` |  |
| rfapi.ports[0].containerPort | int | `8080` |  |
| rfapi.volumes | object | `{}` |  |
| rfapi.volumeMounts | object | `{}` |  |
| rfapi.initContainers | list | `[]` |  |
| rfapi.service.port | int | `80` |  |
| rfapi.service.targetPort | int | `8080` |  |
| rfapi.ingress.ingressClassName | string | `""` |  |
| rfapi.ingress.http.annotations."nginx.ingress.kubernetes.io/proxy-read-timeout" | string | `"3600"` |  |
| rfapi.ingress.http.hosts[0].host | string | `nil` |  |
| rfapi.ingress.http.hosts[0].paths[0].path | string | `"/rfapi/"` |  |
| rfapi.ingress.http.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| rfapi.ingress.websocket.annotations."nginx.ingress.kubernetes.io/configuration-snippet" | string | `"proxy_set_header Upgrade \"websocket\";\nproxy_set_header Connection \"Upgrade\";\n"` |  |
| rfapi.ingress.websocket.annotations."nginx.ingress.kubernetes.io/proxy-read-timeout" | string | `"3600"` |  |
| rfapi.ingress.websocket.annotations."nginx.ingress.kubernetes.io/proxy-send-timeout" | string | `"3600"` |  |
| rfapi.ingress.websocket.annotations."nginx.ingress.kubernetes.io/server-snippets" | string | `"location /rfapi/events {\n  proxy_set_header X-Forwarded-Host $http_host;\n  proxy_set_header X-Forwarded-Proto $scheme;\n  proxy_set_header X-Forwarded-For $remote_addr;\n  proxy_set_header Host $host;\n}\n"` |  |
| rfapi.ingress.websocket.hosts[0].host | string | `nil` |  |
| rfapi.ingress.websocket.hosts[0].paths[0].path | string | `"/rfapi/events"` |  |
| rfapi.ingress.websocket.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| rfapi.resources | object | `{}` |  |
| rfapi.envVars | object | `{}` |  |
| rfapi.envVarsSecret | object | `{}` |  |
| rfapi.startupProbe | object | `{}` |  |
| rfapi.livenessProbe | object | `{}` |  |
| rfapi.readinessProbe | object | `{}` |  |
| rfpubsub.enabled | bool | `true` |  |
| rfpubsub.replicaCount | int | `1` |  |
| rfpubsub.image | string | `"registry1.dso.mil/ironbank/rapidfort/rfpubsub-exe:1.1.45-rfhardened"` |  |
| rfpubsub.ports[0].name | string | `"http"` |  |
| rfpubsub.ports[0].containerPort | int | `8080` |  |
| rfpubsub.volumes | object | `{}` |  |
| rfpubsub.volumeMounts | object | `{}` |  |
| rfpubsub.initContainers | list | `[]` |  |
| rfpubsub.podSecurityContext | object | `{}` |  |
| rfpubsub.containerSecurityContext | object | `{}` |  |
| rfpubsub.service.type | string | `"ClusterIP"` |  |
| rfpubsub.service.port | int | `80` |  |
| rfpubsub.service.targetPort | int | `8080` |  |
| rfpubsub.ingress.className | string | `""` |  |
| rfpubsub.ingress.annotations."nginx.ingress.kubernetes.io/configuration-snippet" | string | `"proxy_set_header Upgrade \"websocket\";\nproxy_set_header Connection \"Upgrade\";\n"` |  |
| rfpubsub.ingress.annotations."nginx.ingress.kubernetes.io/proxy-read-timeout" | string | `"3600"` |  |
| rfpubsub.ingress.annotations."nginx.ingress.kubernetes.io/proxy-send-timeout" | string | `"3600"` |  |
| rfpubsub.ingress.annotations."nginx.ingress.kubernetes.io/server-snippets" | string | `"location /rfpubsub/events {\n  proxy_set_header X-Forwarded-Host $http_host;\n  proxy_set_header X-Forwarded-Proto $scheme;\n  proxy_set_header X-Forwarded-For $remote_addr;\n  proxy_set_header Host $host;\n}\n"` |  |
| rfpubsub.ingress.hosts[0].host | string | `nil` |  |
| rfpubsub.ingress.hosts[0].paths[0].path | string | `"/rfpubsub"` |  |
| rfpubsub.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| rfpubsub.resources | object | `{}` |  |
| rfpubsub.envVars.RFPUBSUB_WS_PORT | int | `8080` |  |
| rfpubsub.envVars.API_KEY | string | `"03f4b34739f506f88c9bbc3410b5d070"` |  |
| rfpubsub.envVars.RF_API_SERVER | string | `"iso-master"` |  |
| rfpubsub.envVarsSecret | object | `{}` |  |
| rfpubsub.startupProbe | object | `{}` |  |
| rfpubsub.livenessProbe | object | `{}` |  |
| rfpubsub.readinessProbe | object | `{}` |  |
| runner.enabled | bool | `true` |  |
| runner.replicaCount | int | `1` |  |
| runner.image | string | `"registry1.dso.mil/ironbank/rapidfort/runner:1.1.45-rfhardened"` |  |
| runner.ports[0].name | string | `"http"` |  |
| runner.ports[0].containerPort | int | `8080` |  |
| runner.ephemeralVolumeClaimTemplates[0].name | string | `"rf-celery-cache"` |  |
| runner.ephemeralVolumeClaimTemplates[0].accessMode | string | `"ReadWriteOnce"` |  |
| runner.ephemeralVolumeClaimTemplates[0].storageClassName | string | `"{{ .Values.storageClass.name }}"` |  |
| runner.ephemeralVolumeClaimTemplates[0].size | string | `"1Gi"` |  |
| runner.ephemeralVolumeClaimTemplates[1].name | string | `"rf-cli-cache"` |  |
| runner.ephemeralVolumeClaimTemplates[1].accessMode | string | `"ReadWriteOnce"` |  |
| runner.ephemeralVolumeClaimTemplates[1].storageClassName | string | `"{{ .Values.storageClass.name }}"` |  |
| runner.ephemeralVolumeClaimTemplates[1].size | string | `"1Gi"` |  |
| runner.ephemeralVolumeClaimTemplates[2].name | string | `"rf-projects-cache"` |  |
| runner.ephemeralVolumeClaimTemplates[2].accessMode | string | `"ReadWriteOnce"` |  |
| runner.ephemeralVolumeClaimTemplates[2].storageClassName | string | `"{{ .Values.storageClass.name }}"` |  |
| runner.ephemeralVolumeClaimTemplates[2].size | string | `"10Gi"` |  |
| runner.ephemeralVolumeClaimTemplates[3].name | string | `"var-lib-containers"` |  |
| runner.ephemeralVolumeClaimTemplates[3].accessMode | string | `"ReadWriteOnce"` |  |
| runner.ephemeralVolumeClaimTemplates[3].storageClassName | string | `"{{ .Values.storageClass.name }}"` |  |
| runner.ephemeralVolumeClaimTemplates[3].size | string | `"256Gi"` |  |
| runner.ephemeralVolumeClaimTemplates[4].name | string | `"imgs-work-dir"` |  |
| runner.ephemeralVolumeClaimTemplates[4].accessMode | string | `"ReadWriteOnce"` |  |
| runner.ephemeralVolumeClaimTemplates[4].storageClassName | string | `"{{ .Values.storageClass.name }}"` |  |
| runner.ephemeralVolumeClaimTemplates[4].size | string | `"256Gi"` |  |
| runner.volumes | list | `[]` |  |
| runner.volumeMounts[0].name | string | `"imgs-work-dir"` |  |
| runner.volumeMounts[0].mountPath | string | `"/opt/rapidfort/local-bucket"` |  |
| runner.volumeMounts[1].name | string | `"var-lib-containers"` |  |
| runner.volumeMounts[1].mountPath | string | `"/var/lib/containers"` |  |
| runner.volumeMounts[2].name | string | `"rf-projects-cache"` |  |
| runner.volumeMounts[2].mountPath | string | `"/opt/rapidfort/runner/app/auth"` |  |
| runner.volumeMounts[3].name | string | `"rf-cli-cache"` |  |
| runner.volumeMounts[3].mountPath | string | `"/opt/rapidfort/runner/app/.rapidfort"` |  |
| runner.volumeMounts[4].name | string | `"rf-celery-cache"` |  |
| runner.volumeMounts[4].mountPath | string | `"/opt/rapidfort/runner/celery_rf"` |  |
| runner.initContainers[0].name | string | `"disk-init"` |  |
| runner.initContainers[0].image | string | `"registry1.dso.mil/ironbank/redhat/ubi/ubi8-minimal:8.9"` |  |
| runner.initContainers[0].command[0] | string | `"/bin/bash"` |  |
| runner.initContainers[0].command[1] | string | `"-c"` |  |
| runner.initContainers[0].command[2] | string | `"chown 1000 -R /opt/rapidfort/runner/app/auth\nchown 1000 -R /opt/rapidfort/runner/app/.rapidfort\nchown 1000 -R /opt/rapidfort/runner/celery_rf\n"` |  |
| runner.initContainers[0].volumeMounts[0].name | string | `"rf-projects-cache"` |  |
| runner.initContainers[0].volumeMounts[0].mountPath | string | `"/opt/rapidfort/runner/app/auth"` |  |
| runner.initContainers[0].volumeMounts[1].name | string | `"rf-cli-cache"` |  |
| runner.initContainers[0].volumeMounts[1].mountPath | string | `"/opt/rapidfort/runner/app/.rapidfort"` |  |
| runner.initContainers[0].volumeMounts[2].name | string | `"rf-celery-cache"` |  |
| runner.initContainers[0].volumeMounts[2].mountPath | string | `"/opt/rapidfort/runner/celery_rf"` |  |
| runner.podSecurityContext | object | `{}` |  |
| runner.containerSecurityContext | object | `{}` |  |
| runner.service.type | string | `"ClusterIP"` |  |
| runner.service.port | int | `80` |  |
| runner.service.targetPort | int | `8080` |  |
| runner.ingress.className | string | `""` |  |
| runner.ingress.annotations | string | `nil` |  |
| runner.ingress.hosts[0].host | string | `nil` |  |
| runner.ingress.hosts[0].paths[0].path | string | `"/runner/"` |  |
| runner.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| runner.resources | object | `{}` |  |
| runner.envVars.RFVDB_HOST | string | `"frontrow.rapidfort.com"` |  |
| runner.envVars.RF_CONTAINER_ENGINE | string | `"podman"` |  |
| runner.envVars.RF_INTERNAL | int | `1` |  |
| runner.envVars.RF_DEBUG | string | `"no"` |  |
| runner.envVarsSecret[0] | string | `"RF_APP_HOST"` |  |
| runner.envVarsSecret[1] | string | `"DB_URL"` |  |
| runner.envVarsSecret[2] | string | `"DEPLOY_MODE"` |  |
| runner.envVarsSecret[3] | string | `"RF_VERBOSE"` |  |
| runner.envVarsSecret[4] | string | `"RF_APP_ADMIN"` |  |
| runner.envVarsSecret[5] | string | `"RF_APP_ADMIN_PASSWD"` |  |
| runner.envVarsSecret[6] | string | `"RF_STORAGE_TYPE"` |  |
| runner.envVarsSecret[7] | string | `"RF_S3_BUCKET"` |  |
| runner.envVarsSecret[8] | string | `"AWS_ACCESS_KEY_ID"` |  |
| runner.envVarsSecret[9] | string | `"AWS_DEFAULT_REGION"` |  |
| runner.envVarsSecret[10] | string | `"AWS_SECRET_ACCESS_KEY"` |  |
| runner.envVarsSecret[11] | string | `"RF_ROLE_ARN"` |  |
| runner.envVarsSecret[12] | string | `"RF_GS_CREDS"` |  |
| runner.envVarsSecret[13] | string | `"RF_AZURE_CONNECTION_STRING"` |  |
| runner.envVarsSecret[14] | string | `"KEYCLOAK_JWT_PUB_KEY"` |  |
| runner.startupProbe | object | `{}` |  |
| runner.livenessProbe.httpGet.path | string | `"/"` |  |
| runner.livenessProbe.httpGet.port | int | `8080` |  |
| runner.livenessProbe.failureThreshold | int | `10` |  |
| runner.readinessProbe.httpGet.path | string | `"/"` |  |
| runner.readinessProbe.httpGet.port | int | `8080` |  |
| runner.readinessProbe.failureThreshold | int | `10` |  |
| rfvdb.enabled | bool | `false` |  |
| rfvdb.replicaCount | int | `1` |  |
| rfvdb.image | string | `"registry1.dso.mil/ironbank/rapidfort/rfvdb:1.1.45-rfhardened"` |  |
| rfvdb.ports[0].name | string | `"http"` |  |
| rfvdb.ports[0].containerPort | int | `8080` |  |
| rfvdb.volumes | object | `{}` |  |
| rfvdb.volumeMounts | object | `{}` |  |
| rfvdb.initContainers | list | `[]` |  |
| rfvdb.podSecurityContext | object | `{}` |  |
| rfvdb.containerSecurityContext | object | `{}` |  |
| rfvdb.service.type | string | `"ClusterIP"` |  |
| rfvdb.service.port | int | `80` |  |
| rfvdb.service.targetPort | int | `8080` |  |
| rfvdb.ingress.className | string | `""` |  |
| rfvdb.ingress.annotations."nginx.ingress.kubernetes.io/proxy-body-size" | string | `"1250m"` |  |
| rfvdb.ingress.hosts[0].host | string | `nil` |  |
| rfvdb.ingress.hosts[0].paths[0].path | string | `"/rfvdb/"` |  |
| rfvdb.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| rfvdb.resources | object | `{}` |  |
| rfvdb.envVars.RF_DEBUG | string | `"no"` |  |
| rfvdb.envVars.RF_RFVDB_PORT | string | `"8080"` |  |
| rfvdb.envVarsSecret[0] | string | `"RF_S3_BUCKET"` |  |
| rfvdb.envVarsSecret[1] | string | `"RF_STORAGE_TYPE"` |  |
| rfvdb.envVarsSecret[2] | string | `"AWS_ACCESS_KEY_ID"` |  |
| rfvdb.envVarsSecret[3] | string | `"AWS_DEFAULT_REGION"` |  |
| rfvdb.envVarsSecret[4] | string | `"AWS_SECRET_ACCESS_KEY"` |  |
| rfvdb.envVarsSecret[5] | string | `"RF_GS_CREDS"` |  |
| rfvdb.envVarsSecret[6] | string | `"RF_ROLE_ARN"` |  |
| rfvdb.envVarsSecret[7] | string | `"RF_APP_HOST"` |  |
| rfvdb.envVarsSecret[8] | string | `"DEPLOY_MODE"` |  |
| rfvdb.envVarsSecret[9] | string | `"RF_VERBOSE"` |  |
| rfvdb.envVarsSecret[10] | string | `"RF_AZURE_CONNECTION_STRING"` |  |
| rfvdb.livenessProbe.httpGet.path | string | `"/"` |  |
| rfvdb.livenessProbe.httpGet.port | int | `8080` |  |
| rfvdb.livenessProbe.failureThreshold | int | `10` |  |
| rfvdb.readinessProbe.httpGet.path | string | `"/"` |  |
| rfvdb.readinessProbe.httpGet.port | int | `8080` |  |
| rfvdb.readinessProbe.failureThreshold | int | `10` |  |
| vulnsdb.enabled | bool | `true` |  |
| vulnsdb.replicaCount | int | `1` |  |
| vulnsdb.image | string | `"registry1.dso.mil/ironbank/rapidfort/vulns-db:1.1.44-1-rfhardened"` |  |
| vulnsdb.ports[0].name | string | `"http"` |  |
| vulnsdb.ports[0].containerPort | int | `8080` |  |
| vulnsdb.volumes | object | `{}` |  |
| vulnsdb.volumeMounts | object | `{}` |  |
| vulnsdb.initContainers | list | `[]` |  |
| vulnsdb.podSecurityContext | object | `{}` |  |
| vulnsdb.containerSecurityContext | object | `{}` |  |
| vulnsdb.service.type | string | `"ClusterIP"` |  |
| vulnsdb.service.port | int | `80` |  |
| vulnsdb.service.targetPort | int | `8080` |  |
| vulnsdb.ingress.className | string | `""` |  |
| vulnsdb.ingress.annotations."nginx.ingress.kubernetes.io/proxy-body-size" | string | `"250m"` |  |
| vulnsdb.ingress.hosts[0].host | string | `nil` |  |
| vulnsdb.ingress.hosts[0].paths[0].path | string | `"/vulns-db/"` |  |
| vulnsdb.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| vulnsdb.resources.limits.cpu | string | `"2"` |  |
| vulnsdb.resources.limits.memory | string | `"4096Mi"` |  |
| vulnsdb.resources.requests.cpu | string | `"1"` |  |
| vulnsdb.resources.requests.memory | string | `"512Mi"` |  |
| vulnsdb.envVars.RFVDB_HOST | string | `"vulndb.rapidfort.com"` |  |
| vulnsdb.envVars.RF_DEBUG | string | `"no"` |  |
| vulnsdb.envVars.REDIS_AOF_ENABLED | string | `"no"` |  |
| vulnsdb.envVarsSecret | object | `{}` |  |
| vulnsdb.startupProbe | object | `{}` |  |
| vulnsdb.livenessProbe.httpGet.path | string | `"/"` |  |
| vulnsdb.livenessProbe.httpGet.port | int | `8080` |  |
| vulnsdb.livenessProbe.failureThreshold | int | `10` |  |
| vulnsdb.readinessProbe.httpGet.path | string | `"/"` |  |
| vulnsdb.readinessProbe.httpGet.port | int | `8080` |  |
| vulnsdb.readinessProbe.failureThreshold | int | `10` |  |
| domain | string | `"bigbang.dev"` | Big Bang Values |
| istio.enabled | bool | `true` |  |
| istio.mtls.mode | string | `"STRICT"` | STRICT = Allow only mutual TLS traffic, PERMISSIVE = Allow both plain text and mutual TLS traffic PERMISSIVE is required for any action which redeploys pods because STRICT interferes with initContainers Can be changed to STRICT after all initContainers have finished but will interfere with upgrades/pod deployments that have initContainers |
| istio.rapidfort.enabled | bool | `true` |  |
| istio.rapidfort.allowed_rf_host | string | `"us01.rapidfort.com"` |  |
| istio.rapidfort.gateways[0] | string | `"istio-system/public"` |  |
| istio.rapidfort.hosts[0] | string | `"rapidfort.{{ .Values.domain }}"` |  |
| networkPolicies.enabled | bool | `true` |  |
| networkPolicies.ingressLabels.app | string | `"public-ingressgateway"` |  |
| networkPolicies.ingressLabels.istio | string | `"ingressgateway"` |  |
| networkPolicies.rapidfortApiIpRange | string | `""` | IP range of api.rapidfort.com |
| networkPolicies.controlPlaneCidr | string | `""` | test |
| bbtests | object | `{"addons":{"minio":{"enabled":false}},"cypress":{"artifacts":true,"envs":{"cypress_url":"http://test.test"}},"enabled":false,"scripts":{"envs":{"URL":"http://test.test"}}}` | Bigbang helm test values - default disabled |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
