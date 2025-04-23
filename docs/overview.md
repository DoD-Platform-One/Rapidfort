# RapidFort Big Bang Helm Chart

[RapidFort](https://www.rapidfort.com) is a platform for software attack surface management.

## RapidFort License

RapidFort requires a software license. Contact info@rapidfort.com with questions or to request a license.

## Minimum Requirements

This document outlines the minimum recommended requirements for deploying the RapidFort application using Helm charts on Kubernetes.

At this time only AWS is supported.

### Kubernetes Cluster (EKS)

* Minimum Node Size
  * Architecture: x86_64
  * CPU: 4 vCPUs
  * Memory: 8 GB RAM
  * Recommended: 8 vCPUs, 16 GB RAM
* Disk Requirements
  * Root disk per node: 256 GB minimum

### Database Requirements (AWS RDS)

* Engine: MySQL 8.0
* Minimum Size: db.r6g.xlarge (4 vCPU, 32 GB RAM)
* Storage: 20 GB minimum with auto-grow enabled, SSD (General Purpose)
* Enabling SSL communication is recommended

### Object Storage (AWS S3)

* Minimum Bucket Size: No explicit minimum, storage scales as needed
* Permissions:
  * IAM policy allowing read/write/delete/list operations
  * Both Role-based and Credentials-based (AWS Access Key ID and Secret Access Key) authentication are supported

### Pod Storage

Storage Class is required for creating PVC volumes.

The RapidFort platform will consume node storage (i.e. emptyDir):

* backend service: 10Gi
* isomaster service: 10Gi
* rfscan service: 10Gi

The platform will create persistent storage using PV and PVCs:

* aggregator service: 29Gi
* file-redis service: 29Gi
* lock-redis service: 29Gi
* redis service: 29Gi
* runner service: 15 Gi

### Kubernetes Resource Requests

Minimum resources per pod:

| Service Name | CPU Request | CPU Limit | Memory Request | Memory Limit |
|--------------|-------------|-----------|----------------|--------------|
| aggregator   | 0.5         | 2         | 0.5Gi          | 4Gi          |
| backend      | 0.5         | 2         | 0.5Gi          | 4Gi          |
| fileupload   | 0.1         | -         | 2Gi            | -            |
| frontrow     | 0.5         | 512Mi     | 1Gi            | 1Gi          |
| file-redis   | 1           | 2         | 2Gi            | 6Gi          |
| isomaster    | 0.5         | 1.5Gi     | 3Gi            | 6Gi          |
| keycloak     | 0.5         | 1Gi       | -              | -            |
| lock-redis   | 0.5         | 1Gi       | -              | -            |
| redis        | 1           | 2         | 2Gi            | 6Gi          |
| rfscan       | 0.15        | 1Gi       | -              | -            |
| rfapi        | 0.1         | 0.25Gi    | -              | -            |
| runner       | 0.1         | 1Gi       | -              | -            |
| vulnsdb      | 0.1         | 1Gi       | -              | -            |
| **Total**    | 5.05        | 14.25     | 11Gi           | 27Gi         |

### Networking

* Load Balancer (optional but recommended): AWS ELB/NLB or equivalent
* Ingress Controller (NGINX, Istio, etc): Deployed via Helm (recommended)
* Outbound access to ```registry1.dso.mil``` with image pull secrets for pulling RapidFort platform container images from Iron Bank

#### DNS Mapping

* The RapidFort deployment must be reachable via DNS
* The RapidFort deployment must be configured for HTTPS communication with valid SSL Certificates

### Vulnerability Database Updates

RapidFort supports 2 options for keeping your vulnerability database up to date.

Database updates may take up to 30 minutes to complete.

* **Option 1 - Internet Connected**
  * Allow outbound access to ```vulndb.rapidfort.com``` over TCP/443
  * Updates will be applied automatically
  * The vulnerability database may also be updated on demand via the RapidFort dashboard by a Super Admin user
* **Option 2 - Airgapped**
  * A Super Admin user will need to download a vulnerability database file and upload this via the RapidFort dashboard
