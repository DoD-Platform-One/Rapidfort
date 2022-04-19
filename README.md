# rapidfort

![Version: 0.1.0-bb.4](https://img.shields.io/badge/Version-0.1.0--bb.4-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

Automated container hardening

## Upstream References
* <https://www.rapidfort.com>

* <https://repo1.dso.mil/platform-one/big-bang/apps/third-party/rapidfort>

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
| secrets.stringData.AWS_ACCESS_KEY_ID | string | `""` |  |
| secrets.stringData.USERNAME_SMTP | string | `""` |  |
| secrets.stringData.PASSWORD_SMTP | string | `""` |  |
| secrets.stringData.SOURCE_ARN | string | `""` |  |
| secrets.stringData.AWS_DEFAULT_REGION | string | `"us-east-1"` |  |
| secrets.stringData.AWS_SECRET_ACCESS_KEY | string | `""` |  |
| secrets.stringData.STS_ACCESS_ID | string | `""` |  |
| secrets.stringData.STS_ROLE_ARN | string | `""` |  |
| secrets.stringData.STS_SECRET_KEY | string | `""` |  |
| secrets.stringData.KEYCLOAK_JWT_PUB_KEY | string | `"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAt0EwFCzsmzWgn7A8A40hzX1kPHab0WZTmUF8OwHt7fyds6sBiSDPnLIh0BgmXIO2WIrGzARm9dVUeAWI/aUI7qucfgYgW7XSwwz7X/IrX6DExsNZzTLxgIfDJR/WP0fo1vO10BQDAtJxEkX5YvFitBFzg4FLKMZP5inAFM21+jfjD2ufi7NWTyFJR6YCLGFma29XHE75yE76+Xq8eH3DI/8xmrU5hw1Yk5GrABf4KYTijsp+QLQZkEycYvfJEPEMigwnARdp6C3VDp/T8OL1hb2YtrZ4vjZ80azEicQ3ea/R05JK6ikfik2SlC5Rm0Ore0Rh4jB1tI51biVa0smsiwIDAQAB"` |  |
| secrets.stringData.KEYCLOAK_CLIENT_ID | string | `"scanners"` |  |
| secrets.stringData.RF_S3_BUCKET | string | `""` |  |
| secrets.stringData.KEYCLOAK_REALM | string | `"customers"` |  |
| secrets.stringData.KEYCLOAK_SERVICE_ACCOUNT_CLIENT_ID | string | `"admin-cli"` |  |
| secrets.stringData.KEYCLOAK_SERVICE_ACCOUNT_CLIENT_SECRET | string | `"5b97220c-838a-4186-bcdd-8cdb77d0e0f3"` |  |
| secrets.stringData.ADMIN_ROLE_ID | string | `"27d3ab99-d8f0-4eb2-bdd5-3b5091eb97bd"` |  |
| secrets.stringData.MEMBER_ROLE_ID | string | `"b653c6eb-2e67-4322-a58e-14e110199215"` |  |
| secrets.stringData.GUEST_ROLE_ID | string | `"5b11397f-db4d-4f98-b3c8-a810e165b55c"` |  |
| secrets.stringData.RF_APP_HOST | string | `""` |  |
| secrets.stringData.SERVICE_TYPE | string | `"ON-PREMISE"` |  |
| secrets.stringData.RF_APP_ADMIN | string | `""` |  |
| aggregator.enabled | bool | `true` |  |
| aggregator.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/aggregator"` |  |
| aggregator.image.tag | string | `"1.1.0-bc0c4fa-1980-rfhardened"` |  |
| aggregator.fullnameOverride | string | `"aggregator"` |  |
| aggregator.env.deploy_mode | string | `"STANDALONE"` |  |
| backend.enabled | bool | `true` |  |
| backend.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/backend"` |  |
| backend.image.tag | string | `"1.1.0-12b88d2-1980-rfhardened"` |  |
| backend.initContainer.image.repository | string | `"registry1.dso.mil/ironbank/big-bang/base"` |  |
| backend.initContainer.image.tag | string | `"1.0.0"` |  |
| backend.initContainer.imagePullSecrets[0].name | string | `"private-registry"` |  |
| backend.fullnameOverride | string | `"backend"` |  |
| backend.env.sender_email_id | string | `nil` |  |
| backend.env.deployment_mode | string | `"STANDALONE"` |  |
| backend.keycloak.serviceName | string | `"keycloak"` |  |
| backend.ingress.enabled | bool | `false` |  |
| frontrow.enabled | bool | `true` |  |
| frontrow.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/frontrow"` |  |
| frontrow.image.tag | string | `"1.1.353-22fc3ee-1980"` |  |
| frontrow.fullnameOverride | string | `"frontrow"` |  |
| frontrow.env.deploy_mode | string | `"STANDALONE"` |  |
| frontrow.ingress.enabled | bool | `false` |  |
| iso-master.enabled | bool | `true` |  |
| iso-master.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/iso-master-exe"` |  |
| iso-master.image.tag | string | `"1.1.0-fe0398f-01"` |  |
| iso-master.fullnameOverride | string | `"iso-master"` |  |
| iso-master.env.deployment_mode | string | `"STANDALONE"` |  |
| iso-master.keycloak.serviceName | string | `"keycloak"` |  |
| iso-master.ingress.enabled | bool | `false` |  |
| keycloak.enabled | bool | `true` |  |
| keycloak.imagePullSecrets[0].name | string | `"private-registry"` |  |
| keycloak.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/keycloak"` |  |
| keycloak.image.tag | string | `"16.1.1"` |  |
| keycloak.connectionTest.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/busybox"` |  |
| keycloak.connectionTest.image.tag | string | `"latest"` |  |
| keycloak.initContainer.image.repository | string | `"registry1.dso.mil/ironbank/opensource/mysql/mysql8"` |  |
| keycloak.initContainer.image.tag | string | `"8.0.28"` |  |
| keycloak.db.addr | string | `"mysql"` |  |
| keycloak.fullnameOverride | string | `"keycloak"` |  |
| keycloak.ingress.enabled | bool | `false` |  |
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
| mysql-orig.enabled | bool | `false` |  |
| mysql-orig.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/mysql"` |  |
| mysql-orig.image.tag | string | `"8.0.27"` |  |
| mysql-orig.connectionTest.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/busybox"` |  |
| mysql-orig.connectionTest.image.tag | string | `"latest"` |  |
| mysql-orig.fullnameOverride | string | `"mysql"` |  |
| redis.enabled | bool | `true` |  |
| redis.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/redis"` |  |
| redis.image.tag | string | `"latest"` |  |
| redis.connectionTest.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/busybox"` |  |
| redis.connectionTest.image.tag | string | `"latest"` |  |
| redis.fullnameOverride | string | `"redis"` |  |
| rf-scan.enabled | bool | `true` |  |
| rf-scan.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/rf-scan-exe"` |  |
| rf-scan.image.tag | string | `"1.1.0-fe0398f-01"` |  |
| rf-scan.connectionTest.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/busybox"` |  |
| rf-scan.connectionTest.image.tag | string | `"latest"` |  |
| rf-scan.fullnameOverride | string | `"rf-scan"` |  |
| rf-scan.env.deployment_mode | string | `"STANDALONE"` |  |
| rf-scan.keycloak.serviceName | string | `"keycloak"` |  |
| rf-scan.ingress.enabled | bool | `false` |  |
| rfapi.enabled | bool | `true` |  |
| rfapi.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/rfapi"` |  |
| rfapi.image.tag | string | `"1.1.0-9233cfa-1980-rfhardened"` |  |
| rfapi.initContainer.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/redis"` |  |
| rfapi.initContainer.image.tag | string | `"latest"` |  |
| rfapi.connectionTest.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/busybox"` |  |
| rfapi.connectionTest.image.tag | string | `"latest"` |  |
| rfapi.fullnameOverride | string | `"rfapi"` |  |
| rfapi.env.deploy_mode | string | `"STANDALONE"` |  |
| rfpubsub.enabled | bool | `true` |  |
| rfpubsub.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/rfpubsub"` |  |
| rfpubsub.image.tag | string | `"1.1.0-a22490b-1980-rfhardened"` |  |
| rfpubsub.fullnameOverride | string | `"rfpubsub"` |  |
| rfpubsub.env.deploy_mode | string | `"STANDALONE"` |  |
| rfpubsub.ingress.enabled | bool | `false` |  |
| rfvdb.enabled | bool | `false` |  |
| rfvdb.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/rfvdb"` |  |
| rfvdb.image.tag | string | `"latest"` |  |
| rfvdb.initContainer.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/redis"` |  |
| rfvdb.initContainer.image.tag | string | `"latest"` |  |
| rfvdb.connectionTest.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/busybox"` |  |
| rfvdb.connectionTest.image.tag | string | `"latest"` |  |
| rfvdb.fullnameOverride | string | `"rfvdb"` |  |
| runner.enabled | bool | `false` |  |
| runner.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/runner"` |  |
| runner.image.tag | string | `"1.1.0-3fac88a-2611-rfhardened"` |  |
| runner.initContainer.image.repository | string | `"registry1.dso.mil/ironbank/big-bang/base"` |  |
| runner.initContainer.image.tag | string | `"1.0.0"` |  |
| runner.fullnameOverride | string | `"runner"` |  |
| runner.env.rf_app_admin | string | `""` |  |
| bbtests.enabled | bool | `false` |  |
| bbtests.cypress.artifacts | bool | `true` |  |
| bbtests.cypress.envs.cypress_url | string | `"http://test.test"` |  |
| bbtests.scripts.envs.URL | string | `"http://test.test"` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
