# rapidfort

![Version: 1.1.27-bb.0](https://img.shields.io/badge/Version-1.1.27--bb.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.1.27](https://img.shields.io/badge/AppVersion-1.1.27-informational?style=flat-square)

Automated Container Hardening

## Learn More
* [Application Overview](docs/overview.md)
* [Other Documentation](docs/)

## Prerequisites

1. Kubernetes Cluster version 1.20+
2. Kubernetes config installed in `~/.kube/config`
3. [Helm](https://helm.sh/docs/intro/install/) version 3.0.0+
4. Ingress Controller with Network Load Balancer. Below are Supported Ingress Controllers
    * Istio Ingress Controller
    * Nginx Ingress Controller
4. Amazon Web Services (AWS) account
    * S3 Bucket for RapidFort data
    * IAM User with Read/Write/List permissions for the S3 bucket
        * Access Key ID
        * Secret Access Key

### AWS Resources
RapidFort needs an S3 bucket and an IAM user and policy with Read/List/Write permissions for the S3 bucket.

1. Create an S3 bucket in the same region in which RapidFort will be deployed (e.g. <code>rapidfort-s3</code>).
2. Create an IAM user (e.g. <code>rapidfort-user</code>). Generate and download an Access Key ID and Secret Access Key.
3. Create an IAM policy that gives Read/List/Write permissions for the RapidFort S3 bucket using the sample JSON code.
   ```json
   {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Sid": "VisualEditor0",
          "Effect": "Allow",
          "Action": [
            "s3:DeleteObject",
            "s3:PutObject",
            "s3:GetObject",
            "s3:DescribeJob",
            "s3:ListBucket"
          ],
          "Resource": [
            "<S3_BUCKET_ARN>",
            "<S3_BUCKET_ARN>/*"
          ]
        }
      ]
   }
   ```
   **Example: AWS Commercial**
   ```json
   {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Sid": "VisualEditor0",
          "Effect": "Allow",
          "Action": [
            "s3:DeleteObject",
            "s3:PutObject",
            "s3:GetObject",
            "s3:DescribeJob",
            "s3:ListBucket"
          ],
          "Resource": [
            "arn:aws:s3:::rapidfort-s3",
            "arn:aws:s3:::rapidfort-s3/*"
          ]
        }
      ]
   }
   ```
   **Example: AWS GovCloud**
   ```json
   {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Sid": "VisualEditor0",
          "Effect": "Allow",
          "Action": [
            "s3:DeleteObject",
            "s3:PutObject",
            "s3:GetObject",
            "s3:DescribeJob",
            "s3:ListBucket"
          ],
          "Resource": [
            "arn:aws-gov:s3:::rapidfort-s3",
            "arn:aws-gov:s3:::rapidfort-s3/*"
          ]
        }
      ]
   }
   ```
4. Attach the policy to the IAM user.
    
### Deploy RapidFort
1. Clone the RapidFort Repository.
2. Update <code>values.yaml</code> with your deployment information. For more information, please refer to [Parameters](#parameters).
3. Run the following command to install RapidFort:
   ```
   cd rapidfort/chart
   helm upgrade --install rapidfort ./ -f values.yaml -n <namespace>
   ```
   For example, if you would like to deploy RapidFort in the <code>rapidfort</code> namespace:
   ```
   cd rapidfort/chart
   helm upgrade --install rapidfort ./ -f values.yaml -n rapidfort
   ```
4. Wait for a RapidFort welcome email. This will contain a link to the RapidFort dashboard.
5. Visit the RapidFort dashboard. You will be guided through the process for contacting RapidFort Support to request a license.

For more information, please refer to the [RapidFort user documentation](https://docs.rapidfort.com/rapidfort-on-premises/helm-chart-aws).

## Parameters

### Global parameters

| Name                      | Description                                                    | Value           |
| ------------------------- | -------------------------------------------------------------- | --------------- |
| `global.rf_app_host`      | Public RapidFort service endpoint (FQDN or IP)    | `""`            |
| `global.ingressClassName` | Ingress class name                                             | `""`            |

### Common parameters

| Name                            | Description                                                                                 | Value           | Required |
| ------------------------------- | ------------------------------------------------------------------------------------------- | --------------- | -------- |
| `secret.aws_access_key_id`                        | AWS credentials with Read/List/Write permissions for the RapidFort S3 bucket                | `""`            | `false`   |
| `secret.aws_secret_access_key`                    | AWS credentials with Read/List/Write permissions for the RapidFort S3 bucket                | `""`            | `false`   |
| `secret.aws_role_arn`                    | AWS IAM Role with Read/List/Write permissions for the RapidFort S3 bucket                | `""`            | `false`   |
| `secret.aws_default_region`                       | AWS region                                                                | `""`            | `true`   |
| `secret.s3_bucket`                                | AWS S3 bucket for Rapidfort data                                     | `""`            | `true`   |
| `secret.rf_app_admin`                             | RapidFort application admin email address                                 | `""`            | `true`   |
| `secret.rf_app_admin_passwd`                      | RapidFort application admin password             | `""`            | `true`   |
| `secret.rf_app_host`                              | Public RapidFort service endpoint (FQDN or IP)   | `""`            | `true`   |
| `secret.storage_type`                              | RapidFort Data Storage Type (s3, ls, gs)   | `""`            | `true`   |


## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| runner_rf_app_host | string | `""` | When internal runner traffic is enabled runner defaults to `backend` for it's url if the backend service name is changed, update it here |
| sharedPvcs.image-db-shared.storageSize | string | `"10Gi"` |  |
| sharedPvcs.imgs-work-dir-shared.storageSize | string | `"10Gi"` |  |
| sharedPvcs.local-bucket.storageSize | string | `"10Gi"` |  |
| sc.enabled | bool | `false` |  |
| aggregator.enabled | bool | `true` |  |
| aggregator.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/aggregator-exe"` |  |
| aggregator.image.tag | string | `"1.1.21-rfhardened"` |  |
| aggregator.initContainers.volumePermissions.image.repository | string | `"registry1.dso.mil/ironbank/redhat/ubi/ubi8-minimal"` |  |
| aggregator.initContainers.volumePermissions.image.tag | string | `"8.6"` |  |
| aggregator.imagePullSecrets[0].name | string | `"private-registry"` |  |
| aggregator.env.redis_host | string | `"redis-master"` |  |
| aggregator.PVCs.aggregatorRaidVolume.storageSize | string | `"3Gi"` |  |
| aggregator.volumes[0].name | string | `"raid-volume"` |  |
| aggregator.volumes[0].persistentVolumeClaim.claimName | string | `"aggregator-raid-volume"` |  |
| aggregator.volumes[1].name | string | `"local-bucket"` |  |
| aggregator.volumes[1].persistentVolumeClaim.claimName | string | `"local-bucket"` |  |
| aggregator.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].key | string | `"app.kubernetes.io/name"` |  |
| aggregator.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].operator | string | `"In"` |  |
| aggregator.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].values[0] | string | `"iso-master"` |  |
| aggregator.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].topologyKey | string | `"kubernetes.io/hostname"` |  |
| backend.enabled | bool | `true` |  |
| backend.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/backend-exe"` |  |
| backend.image.tag | string | `"1.1.21-rfhardened"` |  |
| backend.initContainers.volumePermissions.image.repository | string | `"registry1.dso.mil/ironbank/redhat/ubi/ubi8-minimal"` |  |
| backend.initContainers.volumePermissions.image.tag | string | `"8.6"` |  |
| backend.initContainers.init.image.repository | string | `"registry1.dso.mil/ironbank/big-bang/base"` |  |
| backend.initContainers.init.image.tag | string | `"1.17.0"` |  |
| backend.imagePullSecrets[0].name | string | `"private-registry"` |  |
| backend.env.redis_host | string | `"redis-master"` |  |
| backend.ingress.enabled | bool | `false` |  |
| backend.PVCs.backendImgsWorkDir.storageSize | string | `"10Gi"` |  |
| backend.volumes[0].name | string | `"imgs-work-dir"` |  |
| backend.volumes[0].persistentVolumeClaim.claimName | string | `"imgs-work-dir-shared"` |  |
| backend.volumes[1].name | string | `"local-bucket"` |  |
| backend.volumes[1].persistentVolumeClaim.claimName | string | `"local-bucket"` |  |
| backend.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].key | string | `"app.kubernetes.io/name"` |  |
| backend.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].operator | string | `"In"` |  |
| backend.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].values[0] | string | `"iso-master"` |  |
| backend.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].topologyKey | string | `"kubernetes.io/hostname"` |  |
| frontrow.enabled | bool | `true` |  |
| frontrow.authUrl | string | `""` |  |
| frontrow.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/frontrow"` |  |
| frontrow.image.tag | string | `"1.1.21-rfhardened"` |  |
| frontrow.imagePullSecrets[0].name | string | `"private-registry"` |  |
| frontrow.ingress.enabled | bool | `false` |  |
| iso-master.enabled | bool | `true` |  |
| iso-master.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/iso-master-exe"` |  |
| iso-master.image.tag | string | `"1.1.21-rfhardened"` |  |
| iso-master.imagePullSecrets[0].name | string | `"private-registry"` |  |
| iso-master.env.redis_host | string | `"redis-master"` |  |
| iso-master.env.redis_host_ha | string | `"redis-master"` |  |
| iso-master.ingress.enabled | bool | `false` |  |
| iso-master.PVCs.iso-masterImgsWorkDir.storageSize | string | `"10Gi"` |  |
| iso-master.PVCs.iso-masterImageDb.storageSize | string | `"10Gi"` |  |
| iso-master.volumes[0].name | string | `"imgs-work-dir"` |  |
| iso-master.volumes[0].persistentVolumeClaim.claimName | string | `"imgs-work-dir-shared"` |  |
| iso-master.volumes[1].name | string | `"image-db"` |  |
| iso-master.volumes[1].persistentVolumeClaim.claimName | string | `"image-db-shared"` |  |
| iso-master.volumes[2].name | string | `"dockersock"` |  |
| iso-master.volumes[2].hostPath.path | string | `"/var/run/docker.sock"` |  |
| iso-master.volumes[3].name | string | `"local-bucket"` |  |
| iso-master.volumes[3].persistentVolumeClaim.claimName | string | `"local-bucket"` |  |
| keycloak.enabled | bool | `true` |  |
| keycloak.image.repository | string | `"registry1.dso.mil/ironbank/rapidfort/keycloak"` |  |
| keycloak.image.tag | string | `"18.0.0-legacy"` |  |
| keycloak.initContainers.init_mysql.image.repository | string | `"registry1.dso.mil/ironbank/opensource/mysql/mysql8"` |  |
| keycloak.initContainers.init_mysql.image.tag | string | `"8.0.29"` |  |
| keycloak.imagePullSecrets[0].name | string | `"private-registry"` |  |
| keycloak.ingress.enabled | bool | `false` |  |
| mysql.enabled | bool | `true` | Set 'enabled' to true if you want to deploy a local (in-cluster) mysql instance |
| mysql.seedDatabase | bool | `true` | Seeding database required on intial run. Set to false if conducting a new install with existing data. Ensure this is also set in the keycloak db.addr value |
| mysql.initdbScriptsConfigMap | string | `"init-db-configuration"` |  |
| mysql.fullnameOverride | string | `"mysql"` |  |
| mysql.auth.rootPassword | string | `"mysql"` |  |
| mysql.auth.database | string | `"standalone"` |  |
| mysql.auth.username | string | `"mysql"` |  |
| mysql.auth.password | string | `"mysql"` |  |
| mysql.auth.existingSecret | string | `""` |  |
| redis.enabled | bool | `true` |  |
| redis.image.registry | string | `"registry1.dso.mil"` |  |
| redis.image.repository | string | `"ironbank/bitnami/redis"` |  |
| redis.image.tag | string | `"6.2.7"` |  |
| redis.istio.enabled | bool | `true` |  |
| redis.architecture | string | `"standalone"` |  |
| redis.fullnameOverride | string | `"redis"` |  |
| redis.auth.enabled | bool | `false` |  |
| redis.svcWorkaround | bool | `true` | When enabled adds an extra service for redis to workaround an rfapi bug |
| rf-scan.enabled | bool | `true` |  |
| rf-scan.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/rf-scan-exe"` |  |
| rf-scan.image.tag | string | `"1.1.21-rfhardened"` |  |
| rf-scan.initContainers.volumePermissions.image.repository | string | `"registry1.dso.mil/ironbank/redhat/ubi/ubi8-minimal"` |  |
| rf-scan.initContainers.volumePermissions.image.tag | string | `"8.6"` |  |
| rf-scan.imagePullSecrets[0].name | string | `"private-registry"` |  |
| rf-scan.env.redis_host | string | `"redis-master"` |  |
| rf-scan.env.redis_host_ha | string | `"redis-master"` |  |
| rf-scan.ingress.enabled | bool | `false` |  |
| rf-scan.PVCs.rf-scanImgsWorkDir.storageSize | string | `"10Gi"` |  |
| rf-scan.PVCs.rf-scanImageDb.storageSize | string | `"10Gi"` |  |
| rf-scan.volumes[0].name | string | `"imgs-work-dir"` |  |
| rf-scan.volumes[0].persistentVolumeClaim.claimName | string | `"imgs-work-dir-shared"` |  |
| rf-scan.volumes[1].name | string | `"image-db"` |  |
| rf-scan.volumes[1].persistentVolumeClaim.claimName | string | `"image-db-shared"` |  |
| rf-scan.volumes[2].name | string | `"local-bucket"` |  |
| rf-scan.volumes[2].persistentVolumeClaim.claimName | string | `"local-bucket"` |  |
| rf-scan.volumeMounts[0].name | string | `"imgs-work-dir"` |  |
| rf-scan.volumeMounts[0].mountPath | string | `"/opt/rapidfort/iso-master/app/imgs_work_dir"` |  |
| rf-scan.volumeMounts[1].name | string | `"image-db"` |  |
| rf-scan.volumeMounts[1].mountPath | string | `"/opt/rapidfort/iso-master/app/image_db"` |  |
| rf-scan.volumeMounts[2].name | string | `"local-bucket"` |  |
| rf-scan.volumeMounts[2].mountPath | string | `"/opt/rapidfort/local-bucket"` |  |
| rf-scan.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].key | string | `"app.kubernetes.io/name"` |  |
| rf-scan.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].operator | string | `"In"` |  |
| rf-scan.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].values[0] | string | `"iso-master"` |  |
| rf-scan.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution[0].topologyKey | string | `"kubernetes.io/hostname"` |  |
| rfapi.enabled | bool | `true` |  |
| rfapi.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/rfapi-exe"` |  |
| rfapi.image.tag | string | `"1.1.21-rfhardened"` |  |
| rfapi.initContainers.init.image.repository | string | `"registry1.dso.mil/ironbank/bitnami/redis"` |  |
| rfapi.initContainers.init.image.tag | string | `"6.2.7"` |  |
| rfapi.imagePullSecrets[0].name | string | `"private-registry"` |  |
| rfapi.env.redis_host | string | `"redis-master"` |  |
| rfapi.ingress.websocket.enabled | bool | `false` |  |
| rfapi.ingress.http.enabled | bool | `false` |  |
| rfpubsub.enabled | bool | `true` |  |
| rfpubsub.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/rfpubsub-exe"` |  |
| rfpubsub.image.tag | string | `"1.1.21-rfhardened"` |  |
| rfpubsub.imagePullSecrets[0].name | string | `"private-registry"` |  |
| rfpubsub.env.redis_host | string | `"redis-master"` |  |
| rfpubsub.env.redis_host_ha | string | `"redis-master"` |  |
| rfpubsub.ingress.enabled | bool | `false` |  |
| runner.enabled | bool | `true` |  |
| runner.secret.name | string | `"rf-secret"` | Change to rf-runner-secret to internalize runner traffic |
| runner.image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/runner"` |  |
| runner.image.tag | string | `"1.1.27-rfhardened"` |  |
| runner.initContainers.init.image.repository | string | `"registry1.dso.mil/ironbank/big-bang/base"` |  |
| runner.initContainers.init.image.tag | string | `"1.17.0"` |  |
| runner.imagePullSecrets[0].name | string | `"private-registry"` |  |
| runner.env.redis_host | string | `"redis-master"` |  |
| runner.env.redis_host_ha | string | `"redis-master"` |  |
| runner.ingress.enabled | bool | `false` |  |
| logger.enabled | bool | `false` |  |
| domain | string | `"bigbang.dev"` | Big Bang Values |
| istio.enabled | bool | `false` |  |
| istio.mtls.mode | string | `"PERMISSIVE"` | STRICT = Allow only mutual TLS traffic, PERMISSIVE = Allow both plain text and mutual TLS traffic PERMISSIVE is required for any action which redeploys pods because STRICT interferes with initContainers Can be changed to STRICT after all initContainers have finished but will interfere with upgrades/pod deployments that have initContainers |
| istio.rapidfort.enabled | bool | `true` |  |
| istio.rapidfort.gateways[0] | string | `"istio-system/public"` |  |
| istio.rapidfort.hosts[0] | string | `"rapidfort.{{ .Values.domain }}"` |  |
| networkPolicies.enabled | bool | `false` |  |
| networkPolicies.ingressLabels.app | string | `"istio-ingressgateway"` |  |
| networkPolicies.ingressLabels.istio | string | `"ingressgateway"` |  |
| networkPolicies.rapidfortApiIpRange | string | `""` | IP range of api.rapidfort.com |
| networkPolicies.controlPlaneCidr | string | `""` | test |
| bbtests | object | `{"cypress":{"artifacts":true,"envs":{"cypress_url":"http://test.test"}},"enabled":false,"scripts":{"envs":{"URL":"http://test.test"}}}` | Bigbang helm test values - default disabled |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
