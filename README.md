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
