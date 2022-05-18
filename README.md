# rapidfort

![Version: 1.1.4-bb.7](https://img.shields.io/badge/Version-1.1.4--bb.7-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.1.3](https://img.shields.io/badge/AppVersion-1.1.3-informational?style=flat-square)

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
| secret.aws_access_key_id | string | `""` |  |
| secret.aws_secret_access_key | string | `""` |  |
| secret.aws_default_region | string | `""` |  |
| secret.s3_bucket | string | `""` |  |
| secret.rf_app_admin | string | `""` |  |
| secret.rf_app_admin_passwd | string | `""` |  |
| secret.rf_app_host | string | `""` |  |
| global.rf_app_host | string | `""` |  |
| sc.enabled | bool | `false` |  |
| ingress.enabled | bool | `true` |  |
| aggregator.enabled | bool | `true` |  |
| aggregator.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/aggregator-exe"` |  |
| aggregator.image.tag | string | `"1.1.3-rfhardened"` |  |
| aggregator.initContainers.volumePermissions.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/init"` |  |
| aggregator.env.redis_host | string | `"redis-master"` |  |
| backend.enabled | bool | `true` |  |
| backend.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/backend-exe"` |  |
| backend.image.tag | string | `"1.1.3-rfhardened"` |  |
| backend.initContainers.volumePermissions.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/init"` |  |
| backend.initContainers.init.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/init"` |  |
| backend.env.redis_host | string | `"redis-master"` |  |
| frontrow.enabled | bool | `true` |  |
| frontrow.authUrl | string | `""` |  |
| frontrow.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/frontrow"` |  |
| frontrow.image.tag | string | `"1.1.3-rfhardened"` |  |
| iso-master.enabled | bool | `true` |  |
| iso-master.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/iso-master-exe"` |  |
| iso-master.image.tag | string | `"1.1.3-rfhardened"` |  |
| iso-master.env.redis_host | string | `"redis-master"` |  |
| iso-master.env.redis_host_ha | string | `"redis-master"` |  |
| keycloak.enabled | bool | `true` |  |
| keycloak.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/keycloak"` |  |
| keycloak.image.tag | string | `"16.1.1"` |  |
| keycloak.initContainers.init_mysql.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/init"` |  |
| mysql.enabled | bool | `true` |  |
| mysql.seedDatabase | bool | `true` |  |
| mysql.image.registry | string | `"registry1.dso.mil/ironbank"` |  |
| mysql.image.repository | string | `"opensource/mysql/mysql8"` |  |
| mysql.image.tag | string | `"8.0.28"` |  |
| mysql.image.pullSecrets[0] | string | `"private-registry"` |  |
| mysql.initdbScriptsConfigMap | string | `"init-db-configuration"` |  |
| mysql.fullnameOverride | string | `"mysql"` |  |
| mysql.architecture | string | `"standalone"` |  |
| mysql.auth.rootPassword | string | `"mysql"` |  |
| mysql.auth.database | string | `"standalone"` |  |
| mysql.auth.username | string | `"mysql"` |  |
| mysql.auth.password | string | `"mysql"` |  |
| mysql.auth.existingSecret | string | `""` |  |
| mysql.primary.args[0] | string | `"--default-authentication-plugin=mysql_native_password"` |  |
| redis.enabled | bool | `true` |  |
| redis.istio.enabled | bool | `true` |  |
| redis.architecture | string | `"standalone"` |  |
| redis.fullnameOverride | string | `"redis"` |  |
| redis.auth.enabled | bool | `false` |  |
| rf-scan.enabled | bool | `true` |  |
| rf-scan.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/rf-scan-exe"` |  |
| rf-scan.image.tag | string | `"1.1.3-rfhardened"` |  |
| rf-scan.initContainers.volumePermissions.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/init"` |  |
| rf-scan.env.redis_host | string | `"redis-master"` |  |
| rf-scan.env.redis_host_ha | string | `"redis-master"` |  |
| rfapi.enabled | bool | `true` |  |
| rfapi.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/rfapi"` |  |
| rfapi.image.tag | string | `"1.1.3-rfhardened"` |  |
| rfapi.initContainers.init.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/init"` |  |
| rfapi.env.redis_host | string | `"redis-master"` |  |
| rfpubsub.enabled | bool | `true` |  |
| rfpubsub.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/rfpubsub-exe"` |  |
| rfpubsub.image.tag | string | `"1.1.3-rfhardened"` |  |
| rfpubsub.env.redis_host | string | `"redis-master"` |  |
| rfpubsub.env.redis_host_ha | string | `"redis-master"` |  |
| runner.enabled | bool | `false` |  |
| runner.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/runner"` |  |
| runner.image.tag | string | `"1.1.3-rfhardened"` |  |
| runner.initContainers.init.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/init"` |  |
| runner.env.redis_host | string | `"redis-master"` |  |
| runner.env.redis_host_ha | string | `"redis-master"` |  |
| logger.enabled | bool | `false` |  |
| domain | string | `"bigbang.dev"` |  |
| istio.enabled | bool | `false` |  |
| istio.mtls.mode | string | `"PERMISSIVE"` | STRICT = Allow only mutual TLS traffic, PERMISSIVE = Allow both plain text and mutual TLS traffic PERMISSIVE is required for any action which redeploys pods because STRICT interferes with initContainers Can be changed to STRICT after all initContainers have finished but will interfere with upgrades/pod deployments that have initContainers |
| istio.rapidfort.enabled | bool | `true` |  |
| istio.rapidfort.gateways[0] | string | `"istio-system/public"` |  |
| istio.rapidfort.hosts[0] | string | `"rapidfort.{{ .Values.domain }}"` |  |
| networkPolicies.enabled | bool | `false` |  |
| networkPolicies.ingressLabels.app | string | `"istio-ingressgateway"` |  |
| networkPolicies.ingressLabels.istio | string | `"ingressgateway"` |  |
| bbtests.enabled | bool | `false` |  |
| bbtests.cypress.artifacts | bool | `true` |  |
| bbtests.cypress.envs.cypress_url | string | `"http://test.test"` |  |
| bbtests.scripts.envs.URL | string | `"http://test.test"` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
