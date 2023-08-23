# rapidfort

![Version: 1.1.30-bb.6](https://img.shields.io/badge/Version-1.1.30--bb.6-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.1.30](https://img.shields.io/badge/AppVersion-1.1.30-informational?style=flat-square)

Automated Container Optimization

## Introduction
This is README is a short summary of the RapidFort platform and what is required to deploy RapidFort.

RapidFort perfectly compliments the Big Bang initiative in two major ways:
1. It forms part of the DevSecOps (DSOP) Stack to improve security in customers build pipelines
2. Images hardened by RapidFort (IronBank) can provide the base infrastructure within the DSOP Software Factory.

For more information see:
* [RapidFort Documentation](https://docs.rapidfort.com/)
* [RapidFort Big Bang Documentation](https://docs.rapidfort.com/federal-zone/big-bang-platform-one)


## Prerequisites
1. Kubernetes Cluster version 1.20+
2. Kubernetes config installed in `~/.kube/config`
3. [Helm](https://helm.sh/docs/intro/install/) version 3.0.0+
4. Ingress Controller with Network Load Balancer.
4. Amazon Web Services (AWS) account
    * S3 Bucket for RapidFort data
    * IAM User with Read/Write/List permissions for the S3 bucket
        * Access Key ID
        * Secret Access Key


### AWS Resources
RapidFort needs an S3 bucket and an IAM user and policy with Read/List/Write permissions for the S3 bucket.
Please refer to the [RapidFort AWS s3 documentation](https://docs.rapidfort.com/rapidfort-on-premises/rapidfort-aws-prerequisites#s3-bucket) for full details.

    
### Deploy RapidFort
Please refer to the [RapidFort Big Bang documentation](https://docs.rapidfort.com/federal-zone/big-bang-platform-one) for full details.
For more Helm Chart information, please refer to [RapidFort Helm documentation](https://docs.rapidfort.com/rapidfort-on-premises/helm-chart-aws).


## Parameters

### Common parameters

| Name                            | Description                                                                                 | Value           | Required |
| ------------------------------- | ------------------------------------------------------------------------------------------- | --------------- | -------- |
| `secret.aws_access_key_id`                        | AWS credentials with Read/List/Write permissions for the RapidFort S3 bucket                | `""`            | `true`   |
| `secret.aws_secret_access_key`                    | AWS credentials with Read/List/Write permissions for the RapidFort S3 bucket                | `""`            | `true`   |
| `secret.aws_default_region`                       | AWS region                                                                | `""`            | `true`   |
| `secret.s3_bucket`                                | AWS S3 bucket for Rapidfort data                                     | `""`            | `true`   |
| `secret.rf_app_admin`                             | RapidFort application admin email address                                 | `""`            | `true`   |
| `secret.rf_app_admin_passwd`                      | RapidFort application admin password             | `""`            | `true`   |
| `secret.rf_app_host`                              | Public RapidFort service endpoint (FQDN or IP)   | `""`            | `true`   |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
