# bigbang-rapidfort

![Version: 1.2.4-bb.8](https://img.shields.io/badge/Version-1.2.4--bb.8-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.1.45](https://img.shields.io/badge/AppVersion-1.1.45-informational?style=flat-square)

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

![Version: 1.2.4-bb.9](https://img.shields.io/badge/Version-1.2.4--bb.9-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.1.45](https://img.shields.io/badge/AppVersion-1.1.45-informational?style=flat-square)

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
| db.ssl.enabled | bool | `true` |  |
| db.ssl.secretName | string | `"rapidfort-db-certs"` |  |
| db.ssl.certFile | string | `"-----BEGIN CERTIFICATE-----\nMIIEBzCCAu+gAwIBAgIRAMSbo6rMlQ+TZDCb7zg40qUwDQYJKoZIhvcNAQEMBQAw\ngZsxCzAJBgNVBAYTAlVTMSIwIAYDVQQKDBlBbWF6b24gV2ViIFNlcnZpY2VzLCBJ\nbmMuMRMwEQYDVQQLDApBbWF6b24gUkRTMQswCQYDVQQIDAJXQTE0MDIGA1UEAwwr\nQW1hem9uIFJEUyB1cy1nb3Ytd2VzdC0xIFJvb3QgQ0EgUlNBMjA0OCBHMTEQMA4G\nA1UEBwwHU2VhdHRsZTAgFw0yMjA0MTUyMjM1MjFaGA8yMDYyMDQxNTIzMzUyMVow\ngZsxCzAJBgNVBAYTAlVTMSIwIAYDVQQKDBlBbWF6b24gV2ViIFNlcnZpY2VzLCBJ\nbmMuMRMwEQYDVQQLDApBbWF6b24gUkRTMQswCQYDVQQIDAJXQTE0MDIGA1UEAwwr\nQW1hem9uIFJEUyB1cy1nb3Ytd2VzdC0xIFJvb3QgQ0EgUlNBMjA0OCBHMTEQMA4G\nA1UEBwwHU2VhdHRsZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAM3U\nXJp6XLyNdOmyuj19ZKNmbJTGoRbsnrdxYLxbhQRCykOga7Hh/D5qKPMR/B80OsoK\nuWpxWmQCaCP4Z9Aa9N68L0TRJXZoArZjV8q5nfjsYWQqOPx+cKtIxqvyotov5WE2\nRKaujqpKBAyI49542NNmOEROUshunxYh/7s3Z8oPxOX8kp6hLBtckqUzFbAb7/vM\nX0YpgNUpJ2G1Q9MLKfxEmw2p0WE1FEW35gMvUN4jFtTaKjsXtqGu6iF4YqEASwrv\nvPmLhBHuyKC9ZfEvYzFjw2+l5SMENvhAde10WUpBuJnK+ZoKgFxLOUcdyZO9fR1Y\nwVG5twjPnOhHUOLpAP0CAwEAAaNCMEAwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4E\nFgQUsjcnO96t1VCa/JBZSqY1asXWaZ4wDgYDVR0PAQH/BAQDAgGGMA0GCSqGSIb3\nDQEBDAUAA4IBAQCYx0FHyvrX1CeuKd4CEi50QUZzY1HjGoySz+by6rY1+jZ1v2cp\nJIBrhQ8VUiJ8EqCDKzzv1mBOA1lx+5jpWB2yKP2hq3YJ93BNK+KO7BgasCkUYLGk\nv3c2jo4J5qbWsNsqa/dog+qQbLAcqCx4MeZIadpdLv++ejGPjA0+zjXWwWmQ4RKe\nILiR1wO52uKF90tiDTNi3C5oMaEYbW+Kbsfsx5NpybEU7DkrVKb4MTVgtFuAELrF\n8Zmdbpv8xnUA+oo/QdLLX+eJP/+8tdeDdB6rYFKpJmC2B3EnaKS4X4UpxZJFAgig\noB6q5jNJ5onkWIfx8luNdbagKSFZXHhSO8KP\n-----END CERTIFICATE-----\n-----BEGIN CERTIFICATE-----\nMIIGBzCCA++gAwIBAgIRAOzQCoOR21YG2noWOfFcuNIwDQYJKoZIhvcNAQEMBQAw\ngZsxCzAJBgNVBAYTAlVTMSIwIAYDVQQKDBlBbWF6b24gV2ViIFNlcnZpY2VzLCBJ\nbmMuMRMwEQYDVQQLDApBbWF6b24gUkRTMQswCQYDVQQIDAJXQTE0MDIGA1UEAwwr\nQW1hem9uIFJEUyB1cy1nb3Ytd2VzdC0xIFJvb3QgQ0EgUlNBNDA5NiBHMTEQMA4G\nA1UEBwwHU2VhdHRsZTAgFw0yMTA1MjYyMTQ0MzlaGA8yMTIxMDUyNjIyNDQzOVow\ngZsxCzAJBgNVBAYTAlVTMSIwIAYDVQQKDBlBbWF6b24gV2ViIFNlcnZpY2VzLCBJ\nbmMuMRMwEQYDVQQLDApBbWF6b24gUkRTMQswCQYDVQQIDAJXQTE0MDIGA1UEAwwr\nQW1hem9uIFJEUyB1cy1nb3Ytd2VzdC0xIFJvb3QgQ0EgUlNBNDA5NiBHMTEQMA4G\nA1UEBwwHU2VhdHRsZTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBANwY\nM2iZdnnlMutI9nfn2fWBICAQHWmMmpPmtSka/ziBFyaCxkHDF8RLmooW+GLe+FEF\n9CQKSVqRa7X5AFiqRFF1KvgxWvazawyScuw88JW6Eqhaw0Rlm2p1Iow3TE8FSCDo\nIs1vEV3Brbf26CMiXbqI+aCuTOy0fjRzjl5igViTgZxt2ZXOwyKkF+2T8LQp4b4F\nMh85Ctw1An1DhAemsc3SmcYnPKyFUP90DxGuTjFtfNR01GbBtVYwVvOBgIJe59Zs\nOWcEFOO2mU53Ik6oKcLYu4+PmE5aDvQewb6bkQZchClb7Eg0BPYekWwTPsKUTS3H\nbgdwVxgzjdAdU9fvaaoQmS9xdHWlonKq8CubJdLUduV3WVmDAg7MQgiT3p8JF9W2\nKbQpUbYxqd7j9OIe3IS3rVPwYA8PVh1hUJ+OBLw61sbGRAuN3H+B1DlJh1smg6bR\ng9W+oLRzfjZa32EzFmaQIxtgRfiyjxB/vqAHdl5zPou30X1CyRYquS870O02bvTN\nzzWSOfRY4KPmS1YFVsN+m+R4+hSUOAE//bJ25ACP9oDO5w9NWkAux4e0UUAuWCra\njRROYN2J0KCogdru5G7lOQerD12zi3C2iibty6ou4tQX+MIKMMUVq8cfUH7oKv/R\n8mL5PV/NUsgO248llo0lr9QBwQKdiw17wCxFR+8vAgMBAAGjQjBAMA8GA1UdEwEB\n/wQFMAMBAf8wHQYDVR0OBBYEFPDYnx2xYIPDDAEjb6UcF29I6DgKMA4GA1UdDwEB\n/wQEAwIBhjANBgkqhkiG9w0BAQwFAAOCAgEANTrAGs/GpXCADAwMGlrjXTdohp+p\nCIp3gbnryVYZBXvO+f8hjJ8bHk0D/DiBrkjE8o0IpNaAadOZa+WvTNMsanPmGf1A\nkD0vA9nm4gwEhBbzj9HRYX+dIhZhVWny9Kugm80s0h0hvbwTakUPOdMqkz6wn+xx\nOwh7AIwaC5TTCsQyKlv5rjVblvU1XFgBf3Pf3wvMAfjDoAEPTXER/9mLVbXe+EmW\nosP1JmgyDd+0WQFVK/LEDW81L5hsV5JvthAAFhGVtRw9ko5Ep28+EQUJE1wmLTdL\nPyjB/KfJrTMDq94WolzFv4JpUStHbclkKlXtigjKeiYZ5Yvo+vLMSkXemccSfYn7\nvdaUFD5vqWXvM4xhiYRq/tigw2E1bjmyd9L3XD7XalufZtMGWn7zT8HMPP+/Lch1\nJjZ9LL2Y99VIqhoHcuSa95FtLpYDRQ28K03uwqxqFnOQLyPVmYwsaHKnmmwaZDjF\nK1XxLVRLGRWvKEuSoWrsGcs3ehoxX4Knz/BaJzr/ioU1VnItj53tmOSJO0eMA6k+\negaVEb0FTa2F5xeLCKjgfDDWMz3v0TdL+kt+9z0THMlPWfOzd1C35ZzSIcTcRj22\nSAzsL0t5ZTI4XvoPFF8dga78/KsBRolqdPjs0UzdlKhwh1ADOkTRgLOaaidMEgsT\nJS/rbzD4FPbvc/g=\n-----END CERTIFICATE-----\n-----BEGIN CERTIFICATE-----\nMIICtDCCAjugAwIBAgIQPyg+edjKVnM2PB4KZVu66jAKBggqhkjOPQQDAzCBmjEL\nMAkGA1UEBhMCVVMxIjAgBgNVBAoMGUFtYXpvbiBXZWIgU2VydmljZXMsIEluYy4x\nEzARBgNVBAsMCkFtYXpvbiBSRFMxCzAJBgNVBAgMAldBMTMwMQYDVQQDDCpBbWF6\nb24gUkRTIHVzLWdvdi13ZXN0LTEgUm9vdCBDQSBFQ0MzODQgRzExEDAOBgNVBAcM\nB1NlYXR0bGUwIBcNMjEwNTI2MjE1MzI3WhgPMjEyMTA1MjYyMjUzMjdaMIGaMQsw\nCQYDVQQGEwJVUzEiMCAGA1UECgwZQW1hem9uIFdlYiBTZXJ2aWNlcywgSW5jLjET\nMBEGA1UECwwKQW1hem9uIFJEUzELMAkGA1UECAwCV0ExMzAxBgNVBAMMKkFtYXpv\nbiBSRFMgdXMtZ292LXdlc3QtMSBSb290IENBIEVDQzM4NCBHMTEQMA4GA1UEBwwH\nU2VhdHRsZTB2MBAGByqGSM49AgEGBSuBBAAiA2IABFaqyIYrbpPfhiKzLEkmzp1j\n3OYO/e1VE3vCf5c62bN5xYKFKH/MnKgsUFNsFpJ1t0p9cexi+607aiYOo1sOWvOj\nq3PUu+ltklQdvunU/Se5++qqsh7lylL5OF/F19uqfqNCMEAwDwYDVR0TAQH/BAUw\nAwEB/zAdBgNVHQ4EFgQUJHPtPhijPquZxTz2UGh4YV1npYMwDgYDVR0PAQH/BAQD\nAgGGMAoGCCqGSM49BAMDA2cAMGQCMHWDFuIZ9LZgysbL4vx/Ox9z8fbegb3352bM\nBFr6JV1x8VLbePblHd0V1MwDdRWeAwIwarWfOVdB1ijrwzjROzCwE0uBkHYUPr0Z\nvgwdtlsnwDw9TnjsBrTJkQ0aS8c0Ahl1\n-----END CERTIFICATE-----\n-----BEGIN CERTIFICATE-----\nMIICtjCCAjugAwIBAgIQCojG1Zix0YArC/bBkU7eOjAKBggqhkjOPQQDAzCBmjEL\nMAkGA1UEBhMCVVMxIjAgBgNVBAoMGUFtYXpvbiBXZWIgU2VydmljZXMsIEluYy4x\nEzARBgNVBAsMCkFtYXpvbiBSRFMxCzAJBgNVBAgMAldBMTMwMQYDVQQDDCpBbWF6\nb24gUkRTIHVzLWdvdi1lYXN0LTEgUm9vdCBDQSBFQ0MzODQgRzExEDAOBgNVBAcM\nB1NlYXR0bGUwIBcNMjEwNTI2MjIyODU4WhgPMjEyMTA1MjYyMzI4NThaMIGaMQsw\nCQYDVQQGEwJVUzEiMCAGA1UECgwZQW1hem9uIFdlYiBTZXJ2aWNlcywgSW5jLjET\nMBEGA1UECwwKQW1hem9uIFJEUzELMAkGA1UECAwCV0ExMzAxBgNVBAMMKkFtYXpv\nbiBSRFMgdXMtZ292LWVhc3QtMSBSb290IENBIEVDQzM4NCBHMTEQMA4GA1UEBwwH\nU2VhdHRsZTB2MBAGByqGSM49AgEGBSuBBAAiA2IABKZfn/XfCIlHTE/YF5lH9D2h\nH71kG3RaC92hBPbyncbDMf2Q7JeYwhknKahWmSO/EP0Nj+9iCFimT/Jb9o9ykkKl\ngOvv/M6SQAuKsC/24PxwC8QV1miuTMUd7fGhNjQUHKNCMEAwDwYDVR0TAQH/BAUw\nAwEB/zAdBgNVHQ4EFgQUniTlDl2igVgummx44YNMd5t4mMgwDgYDVR0PAQH/BAQD\nAgGGMAoGCCqGSM49BAMDA2kAMGYCMQCSb8X09cnFdS90i1nqRLhancNU8bCFoI86\nhqyctq0ftvXXmEe0bA+JnpIm5p/UKUUCMQCYYYQFfkeZtD4SOxSIE+WzfghJFaAq\n/s17Q6LU2tCl4/csuzsTAl/vCc0JVynH340=\n-----END CERTIFICATE-----\n-----BEGIN CERTIFICATE-----\n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\nJFiKTJMbfPV2uQ==\n-----END CERTIFICATE-----\n-----BEGIN CERTIFICATE-----\nMIIEBzCCAu+gAwIBAgIRAOYJ9HCNT4ONuUhBhtQkCWowDQYJKoZIhvcNAQEMBQAw\ngZsxCzAJBgNVBAYTAlVTMSIwIAYDVQQKDBlBbWF6b24gV2ViIFNlcnZpY2VzLCBJ\nbmMuMRMwEQYDVQQLDApBbWF6b24gUkRTMQswCQYDVQQIDAJXQTE0MDIGA1UEAwwr\nQW1hem9uIFJEUyB1cy1nb3YtZWFzdC0xIFJvb3QgQ0EgUlNBMjA0OCBHMTEQMA4G\nA1UEBwwHU2VhdHRsZTAgFw0yMjA0MTUyMzE0NDlaGA8yMDYyMDQxNjAwMTQ0OVow\ngZsxCzAJBgNVBAYTAlVTMSIwIAYDVQQKDBlBbWF6b24gV2ViIFNlcnZpY2VzLCBJ\nbmMuMRMwEQYDVQQLDApBbWF6b24gUkRTMQswCQYDVQQIDAJXQTE0MDIGA1UEAwwr\nQW1hem9uIFJEUyB1cy1nb3YtZWFzdC0xIFJvb3QgQ0EgUlNBMjA0OCBHMTEQMA4G\nA1UEBwwHU2VhdHRsZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANwz\nj5S2lfJdNxNGf4zrSXUR+23coWdO6oXUJgkj0c8DZnnLer/4dAa2Aah9wsq/TxmJ\nYgzBganNQEghy1ru0GqA7R/NYePXqikTPfVgcNrVRBzPA69/C0bHT+/3XGYkPrxP\nHNER5ctaLhgu4zkF9DI6m9ajPbEV/6nZMKYczhaigqW7Ff/eq3TKtisZLj8KrDYd\ngswBTLgil5GV+CGdmlb32fCpBrTnrXyqUe/WANv0hTD4IZ/+caUVjAaiSLYiMNMw\n+oO1872rtK4kjF4U2TOzkOl4kbvvuhSOA+qDUBUwf0HmJc4+Y6/cRBsqbxJ4R21G\nTpj/XOc+aoU+lgvDGcsCAwEAAaNCMEAwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4E\nFgQUvFFLeSz7XHbjkKaCFM2LQlOEQO4wDgYDVR0PAQH/BAQDAgGGMA0GCSqGSIb3\nDQEBDAUAA4IBAQCd4a9nrcjbtCZFGV5RzJUzSw/oDIJVKYMicehsecZLgVY+DwiC\nl2IuaPZWu3YpjXerWz7BPBJUhx43u4Bi+yWWrnz+i0porH6jrCGrfi8uou3TRwni\nBcRvq3v8vJZ23HY6NGbVdrtqD2g2lWRFqwRJXxs+uueqfLlS40uahVyJgldfbWfE\nAetbBBycjgaj4MPVURdylqXpl8dIhUIwHs3k4gFsAmzwF7hg+HzpDlCY/1TLCp0B\nk88UItrPSHCAVAefPk5PhjwLC7MDE3ZBJQxdT4R1nXuEEoFaqqxL81RLcqpUI6PU\n4Nv4+7bXbAfksPVRtf4bOoVLH7HOm7WJdRym\n-----END CERTIFICATE-----\n-----BEGIN CERTIFICATE-----\nMIIEKTCCAxGgAwIBAgIRAJBTikKsddbtojh66kNQyDswDQYJKoZIhvcNAQEMBQAw\ngZsxCzAJBgNVBAYTAlVTMSIwIAYDVQQKDBlBbWF6b24gV2ViIFNlcnZpY2VzLCBJ\nbmMuMRMwEQYDVQQLDApBbWF6b24gUkRTMQswCQYDVQQIDAJXQTE0MDIGA1UEAwwr\nQW1hem9uIFJEUyB1cy1nb3Ytd2VzdC0xIFJvb3QgQ0EgUlNBMjA0OCBHMTEQMA4G\nA1UEBwwHU2VhdHRsZTAeFw0yMjA0MjAyMDQ4MTBaFw0yNzA0MjAyMTQ4MTBaMIGb\nMQswCQYDVQQGEwJVUzEQMA4GA1UEBwwHU2VhdHRsZTETMBEGA1UECAwKV2FzaGlu\nZ3RvbjEiMCAGA1UECgwZQW1hem9uIFdlYiBTZXJ2aWNlcywgSW5jLjETMBEGA1UE\nCwwKQW1hem9uIFJEUzEsMCoGA1UEAwwjQW1hem9uIFJEUyB1cy1nb3Ytd2VzdC0x\nIFJTQTIwNDggRzEwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQColzcV\nJy1vtwdIh0BQeyDbOWSkamCA+8MiwLowGu0dHAPS6RU+YCRmliumrDaSRG3rOIUi\nrLC5RZSQ0lOpLARmJgmPE6Q4JIiroP4P6qh7go3QBCHGgNGsGs4Ho5PfokY6lfVV\nllQk7o2ls/WE25mhVEQ3IHgM7rNK4M/cI837jlsHGbKkkhottPhULIiJayl4DRsS\neXfWpqoBHld1fKnF8Zd+YDvWh78hNPYxJd0ISKsNJdXDN6SVXEQJxyhVD5qatr4C\nJc2qmSu4z/Vfa+Q7g7XwfP17raXXAqfHQh/lJuE6yQJ3ye5kTSOvg+ep9yk3WRL6\nW0l4V8J7RnhuAs8hAgMBAAGjZjBkMBIGA1UdEwEB/wQIMAYBAf8CAQAwHwYDVR0j\nBBgwFoAUsjcnO96t1VCa/JBZSqY1asXWaZ4wHQYDVR0OBBYEFI1kGCvQCMzHebse\nL2HCZgQcC+HkMA4GA1UdDwEB/wQEAwIBhjANBgkqhkiG9w0BAQwFAAOCAQEAfhGp\nK1tZlHdQxvTDlY2XNeN2ZRSPzvuWbPRDgV/2MKLMpyrSpVeyfCYl8yUix3Cn5kCj\nU9p23JnLmSS4ofSzRhHQq6+kWNkT4Q18pd1Epohr4a1FXV8CXAbFJpq0K7yKyeSx\nfYEUHcBcihXQeTCTfVvLGiAzpOfifag36bLCm59FNqxA18xWBgz8lYHRoy59KWrl\nPCipRMVZEAWorHiI7a38QrelPW06a0oBNojFmAVokEgkjzP4ihVTNCymLPhRG8GC\niiRN0u+I8cyKjLz8hnviKXkJpgewcMJeFUivKCYEu0R7K5Oc4unSyu0uhz4I+yYL\n3cN5BjDt6Dzd7DM4vQ==\n-----END CERTIFICATE-----\n-----BEGIN CERTIFICATE-----\n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\n-----END CERTIFICATE-----\n-----BEGIN CERTIFICATE-----\nMIIEKDCCAxCgAwIBAgIQaC/DN4ySdcKe6GO0sGy0UTANBgkqhkiG9w0BAQwFADCB\nmzELMAkGA1UEBhMCVVMxIjAgBgNVBAoMGUFtYXpvbiBXZWIgU2VydmljZXMsIElu\nYy4xEzARBgNVBAsMCkFtYXpvbiBSRFMxCzAJBgNVBAgMAldBMTQwMgYDVQQDDCtB\nbWF6b24gUkRTIHVzLWdvdi1lYXN0LTEgUm9vdCBDQSBSU0EyMDQ4IEcxMRAwDgYD\nVQQHDAdTZWF0dGxlMB4XDTIyMDQyMDE5MjEyNloXDTI3MDQyMDIwMjEyNlowgZsx\nCzAJBgNVBAYTAlVTMRAwDgYDVQQHDAdTZWF0dGxlMRMwEQYDVQQIDApXYXNoaW5n\ndG9uMSIwIAYDVQQKDBlBbWF6b24gV2ViIFNlcnZpY2VzLCBJbmMuMRMwEQYDVQQL\nDApBbWF6b24gUkRTMSwwKgYDVQQDDCNBbWF6b24gUkRTIHVzLWdvdi1lYXN0LTEg\nUlNBMjA0OCBHMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANBmYrBC\n7lik4c1tB2MSsc43/Qr0xCfmz2j7e2J93pGKohtfttGZ5E0VOy2uUJoLt624/Mnj\n5c+XFqMVblAoq4PBw3MuNIOBiA663hAqvj0JJG8FV3CgQ459D3liBY/3zCVEdWsu\nLxigOiXJUFY5ve0PXo3uQjzmfZtDUJqUCS7kGx7zXuo8MGd5RoqS+O52i/t7uoJz\ndbufzw/h1SBwcmB3qyZBW9j0wR/d7Hp7UgP3Dp5oyo7+yP7QNiIpj5U8Wi8CZAoe\nrGBTp70A3LdTuD8xCFcSVgNEoFIZspfj5QBkbxqydhMG2z57PUF83K+AZET4IUdN\nSX/+xteRlLCjhUUCAwEAAaNmMGQwEgYDVR0TAQH/BAgwBgEB/wIBADAfBgNVHSME\nGDAWgBS8UUt5LPtcduOQpoIUzYtCU4RA7jAdBgNVHQ4EFgQUXUiCehbDGqpot4A6\nAhrG+Qb3UYgwDgYDVR0PAQH/BAQDAgGGMA0GCSqGSIb3DQEBDAUAA4IBAQAwwFi4\n7WlTUfMccehtJSq7TUZd1wRzJkqhY1Y9KjbJCvqiSSJ3VlCtMAbYf3PUKba7LLwl\nalfhr9DqJfo1R3CNKnWXtNtDzeZ7i60aTP6MQ5BdfQhd99FcmHrMqwN45js0paTl\n2L0hHK346K1dcT82MW5Xk9/oUVFMnNRKT/52g77J+qwZkHDol0k1X59bB7oFH6E/\nB8WCnDwhzPlfiUUmVAcZpoR2C53JWCbTv0U2FBLjVaVXUdqZ8byC8sB6aw7Y8tH7\n+PXMAGpLrenHkp+ozeTLtnmGbtDGFSlRkJU+Zw0i2CtPaoo541Q2BVZjipTl1Tir\nF9yG3bosMKACSbYb\n-----END CERTIFICATE-----\n-----BEGIN CERTIFICATE-----\n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\n-----END CERTIFICATE-----\n"` |  |
| db.auth.username | string | `"rapidfort"` |  |
| db.auth.password | string | `"WPLqAmFjF6"` |  |
| db.auth.port | int | `3306` |  |
| db.auth.host | string | `"mysql"` |  |
| db.auth.db_name | string | `"standalone"` |  |
| aggregator.enabled | bool | `true` |  |
| aggregator.replicaCount | int | `1` |  |
| aggregator.image | string | `"274057717848.dkr.ecr.us-east-1.amazonaws.com/aggregator-exe:1.1.0-348714f-1250973506-rfhardened-DoD"` |  |
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
| backend.image | string | `"274057717848.dkr.ecr.us-east-1.amazonaws.com/backend-exe:1.1.0-cd60bda4-1250973506-rfhardened-DoD"` |  |
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
| fileupload.image | string | `"274057717848.dkr.ecr.us-east-1.amazonaws.com/fileupload:1.1.0-d960c2b-1250973506-rfhardened-DoD"` |  |
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
| frontrow.image | string | `"274057717848.dkr.ecr.us-east-1.amazonaws.com/frontrow:1.1.0-6c481f07-1250973506-rfhardened-DoD"` |  |
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
| isomaster.image | string | `"274057717848.dkr.ecr.us-east-1.amazonaws.com/iso-master-exe:1.1.0-cd9e024-1250973506-rfhardened-DoD"` |  |
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
| keycloak.envVars.KC_DB_URL | string | `"{{ (include \"rapidfort-platform.jdbc_db_url\" .) }}"` |  |
| keycloak.envVarsSecret | object | `{}` |  |
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
| mysql.enabled | bool | `false` |  |
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
| mysql.livenessProbe.exec.command[4] | string | `"root"` |  |
| mysql.livenessProbe.exec.command[5] | string | `"-p{{ .Values.db.auth.password }}"` |  |
| mysql.livenessProbe.exec.command[6] | string | `"-e"` |  |
| mysql.livenessProbe.exec.command[7] | string | `"SHOW DATABASES;"` |  |
| mysql.livenessProbe.failureThreshold | int | `10` |  |
| mysql.readinessProbe.exec.command[0] | string | `"mysql"` |  |
| mysql.readinessProbe.exec.command[1] | string | `"-h"` |  |
| mysql.readinessProbe.exec.command[2] | string | `"localhost"` |  |
| mysql.readinessProbe.exec.command[3] | string | `"-u"` |  |
| mysql.readinessProbe.exec.command[4] | string | `"root"` |  |
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
| rfscan.image | string | `"274057717848.dkr.ecr.us-east-1.amazonaws.com/rf-scan-exe:1.1.0-cd9e024-1250973506-rfhardened-DoD"` |  |
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
| rfapi.image | string | `"274057717848.dkr.ecr.us-east-1.amazonaws.com/rfapi-exe:1.1.0-6ed7411-1250973506-rfhardened-DoD"` |  |
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
| rfpubsub.image | string | `"274057717848.dkr.ecr.us-east-1.amazonaws.com/rfpubsub-exe:1.1.0-2467ae6-1250973506-rfhardened-DoD"` |  |
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
| runner.image | string | `"274057717848.dkr.ecr.us-east-1.amazonaws.com/runner:1.1.0-e237cbe-1250973506-rfhardened-DoD"` |  |
| runner.ports[0].name | string | `"http"` |  |
| runner.ports[0].containerPort | int | `8080` |  |
| runner.ephemeralVolumeClaimTemplates[0].name | string | `"var-lib-containers"` |  |
| runner.ephemeralVolumeClaimTemplates[0].accessMode | string | `"ReadWriteOnce"` |  |
| runner.ephemeralVolumeClaimTemplates[0].storageClassName | string | `"{{ .Values.storageClass.name }}"` |  |
| runner.ephemeralVolumeClaimTemplates[0].size | string | `"256Gi"` |  |
| runner.ephemeralVolumeClaimTemplates[1].name | string | `"imgs-work-dir"` |  |
| runner.ephemeralVolumeClaimTemplates[1].accessMode | string | `"ReadWriteOnce"` |  |
| runner.ephemeralVolumeClaimTemplates[1].storageClassName | string | `"{{ .Values.storageClass.name }}"` |  |
| runner.ephemeralVolumeClaimTemplates[1].size | string | `"256Gi"` |  |
| runner.volumes | list | `[]` |  |
| runner.volumeMounts[0].name | string | `"imgs-work-dir"` |  |
| runner.volumeMounts[0].mountPath | string | `"/opt/rapidfort/local-bucket"` |  |
| runner.volumeMounts[1].name | string | `"var-lib-containers"` |  |
| runner.volumeMounts[1].mountPath | string | `"/var/lib/containers"` |  |
| runner.initContainers | list | `[]` |  |
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
| vulnsdb.image | string | `"274057717848.dkr.ecr.us-east-1.amazonaws.com/vulns-db:1.1.0-8730339-1250973506-rfhardened-DoD"` |  |
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
