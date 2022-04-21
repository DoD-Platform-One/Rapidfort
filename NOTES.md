# RapidFort Notes

- ~~rf-version-info ConfigMap: Need information on data that is needed to populate this ConfigMap for deployments. TODO comments are in `chart/charts/<microservice>/templates/deployment.yaml`~~
  - Configmap info was provided by RF, was implemented in parent chart via the `configmap.yaml` and the `resources/.env` files, this may not be the best way to go about this, especially since the `.env` file contains what should be a secret, but it works for now.

- Commented out `nodeSelector` field in `chart/charts/backend/values.yaml`

- Created two PersistentVolumeClaims at `chart/charts/iso-master/templates/pvc.yaml`

- Redis is using the `latest` image tag - we should use an explicit Big Bang redis package

- HPA's will require the existence of a metrics server on the target cluster. 

- Will need real-world resource consumption by each service for realistic requests/limits in the templates

## Ingress paths/pods/ports

- backend
  - /api/v1/.*
  - port 80
- frontrow
  - /.*
  - /cli/.*
  - port 80
- iso-master
  - /iso-master/.*
  - port 80
- keycloak
  - /auth/.*
  - port 80
- rf-scan
  - /rf-scan/.*
  - port 80
- rfapi
  - rfapi seems to have some special sauce, here's the value definition of ingress
```
ingress:
  websocket:
    enabled: true
    className: rf-ingress-class
    annotations:
      nginx.ingress.kubernetes.io/proxy-read-timeout: "3600"
      nginx.ingress.kubernetes.io/proxy-send-timeout: "3600"
      nginx.ingress.kubernetes.io/configuration-snippet: |
        proxy_set_header Upgrade "websocket";
        proxy_set_header Connection "Upgrade";
      nginx.ingress.kubernetes.io/server-snippets: |
        location /rfapi/events {
          proxy_set_header X-Forwarded-Host $http_host;
          proxy_set_header X-Forwarded-Proto $scheme;
          proxy_set_header X-Forwarded-For $remote_addr;
          proxy_set_header Host $host;
        }
    hosts:
      - host:
        paths:
          - path: /rfapi/events
            pathType: ImplementationSpecific
    tls: []
  http:
    enabled: true
    className: rf-ingress-class
    annotations:
      nginx.ingress.kubernetes.io/use-regex: "true"
    hosts:
      - host:
        paths:
          - path: /rfapi
            pathType: ImplementationSpecific
    tls: []
```
- rfpubsub
  - /rfpubsub
  - port 80
  - code below is a snippet from values pertaining to ingress, prob have to implement this via istio
```
annotations:
  nginx.ingress.kubernetes.io/proxy-read-timeout: "3600"
  nginx.ingress.kubernetes.io/proxy-send-timeout: "3600"
  nginx.ingress.kubernetes.io/configuration-snippet: |
    proxy_set_header Upgrade "websocket";
    proxy_set_header Connection "Upgrade";
  nginx.ingress.kubernetes.io/server-snippets: |
    location /rfpubsub {
      proxy_set_header X-Forwarded-Host $http_host;
      proxy_set_header X-Forwarded-Proto $scheme;
      proxy_set_header X-Forwarded-For $remote_addr;
      proxy_set_header Host $host;
    }
```
- runner
  - not sure if runner actually needs ingress or not, TODO
  - /runner/.*
  - port 80

## RapidFort Services

### aggregator

- Uses a `latest` image tag - will need an explicit version
- Mounts some custom hostPath directories - will require background information (IE - `/opt/rapidfort/data/aggregator/` named "raid-volume")
- No service resource - how does the architecture utilize this service? data/processing?

### backend

- Uses a "stable" image tag - will need an explicit version
- Resource requests provided
- Mounts some custom hostPath directories - will require background information (IE - `/mnt/s3data`)
- `KEYPAIR_NAME` environment variable is hardcoded
- References a secret `rf-connection` that is not generated from a chart
- HPA will require a metrics server on the target cluster

### frontrow

- Uses a "stable" image tag - will need an explicit version
- Will require resource declarations
- No persistent volume mounts


### isomaster

- Requires privileges
- Mounts `hostPath` and `persistentVolumes`
- References a secret `rf-connection` that is not generated from a chart
- Hardcoded environment variables in the deployment
- Exposes traffic externally 
- initContainer has a hardcoded image
- Dependency on the ability to pull/run the rfstub apline base image?

### rfapi

- Uses `latest` image tag - will need an explicit version
- Provisions an ingress for external access - is this required?
    - Creates two ingresses for a single service (websocket/http) - pertinent if creating virtualservices
- HPA will require a metrics server on the target cluster

### rfpubsub

- `API_KEY` is hardcoded in the deployment.yaml - should consume value from values
- Deployment/Values references a secret through `secretName` for which there is no secret resource created
- No persistent data requirements
- Provisions an ingress for external access - is this required?
- Uses explicit `1.0.1` image tag

### rfvdb

- uses `hostPath` for persistent data
- uses `latest` image tag
- HPA will require a metrics server on the target cluster
- `RF_RFVDB_REDIS_DB` environment variable is hardcoded in the deployment
- Dependency on access to a redis service

### Runner

- Deployment uses `hostPath` for host directory access / container runtime socket access.
- Exposed via ingress to allow external traffic (CLI or other)
    - Will require a virtual service
- Image uses a `latest` tag - will require an explicit tag to pass policies
- Dependency on the backend service available


# Open Source Packages

## keycloak

- Keycloak - `15.1.1` is not an available image version on registry1. Likely need to check compatibility with an updated image through the use of a bigbang keycloak package. 
- Would integration work with the latest keycloak release (v1.17.x)
- Worth pulling the existing bigbang package

## redis

- Uses the `latest` tag
- Worth pulling the existing bigbang package
- Noted dependency to the rfvdb service

## mysql

- Only defined as a dependency, no local package provided
- Document this dependency explicitly
- Entertain the option of using the big-bang mysql package for local dev / on-premise deployments