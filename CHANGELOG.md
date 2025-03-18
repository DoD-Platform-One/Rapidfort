# Changelog

Format: [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

## [1.2.5-bb.4]
- fix volume mount.

## [1.2.5-bb.3]
- Update values for image to change to image.repository and image.tag.

## [1.2.5-bb.2]
- RapidFort Release 1.1.165 patch 2.

## [1.2.5-bb.1]
- RapidFort Release 1.1.165 patch.

## [1.2.5-bb.0]
- RapidFort Release 1.1.165

## [1.2.4-bb.15]
- Update RapidFort Service Entry configuration to make it local.

## [1.2.4-bb.14]
- Pass KeyCloak Admin Credentials.

## [1.2.4-bb.13]
- Remove rf user from KeyCloak Database.

## [1.2.4-bb.12]
- Update DB Initialization update for bash variable check.

## [1.2.4-bb.11]
- Update DB Initialization update for helm hook.

## [1.2.4-bb.10]
- Update DB Initialization to stop overwriting db.

## [1.2.4-bb.9]
- Update DB Connection SSL Cert input which creates secret in external db seed job.

## [1.2.4-bb.8]
- Update DB Connection SSL Cert input which creates secret.

## [1.2.4-bb.7]
- Update For DB Connection with centralize Params reference from values.yaml

## [1.2.4-bb.6]
- Update For SSL Connection with SSL Certificate

## [1.2.4-bb.5]
- Update DB Connection to set SSL=True.

## [1.2.4-bb.4]
- hotfix Helm chart deployment support with External RDS.

## [1.2.4-bb.3]
- Helm chart deployment support with External RDS.

## [1.2.4-bb.2]
- Update init container for permission set for lock-redis

## [1.2.4-bb.1]
- Update mtls for mysql and redis

## [1.2.4-bb.0]
- RapidFort Release 1.1.89 for Keycloak Update and removal of Init Containers

## [1.2.3-bb.2]
- update runner service for critical hot fix

## [1.2.3-bb.1]
- update runner service for hot fix

## [1.2.3-bb.0]
- update storage class creation and provide existing storage class
- convert istio permissive to strict
- remove init containers

## [1.2.2-bb.0]
- Update Rapidfort Helm chart for init containers
- update Rapidfort image(s) for new release.

## [1.2.1-bb.5]
- update place holder to be appropriate with comments
- update frontrow image tag.

## [1.2.1-bb.4]
- Update with release images.

## [1.2.1-bb.3]
- Update Docker Image for File Upload, Runner and Vulns DB for fips fix

## [1.2.1-bb.2]
- Update Docker Image for Init Container

## [1.2.1-bb.1]
- Update volume ownership and container security policy for aggregator service

## [1.2.1-bb.0]
- RapidFort Release 1.1.43-1

## [1.2.0-bb.6]
- Update Container security policy.

## [1.2.0-bb.5]
- Change the Service account name.

## [1.2.0-bb.4]
- Change the Service account name.

## [1.2.0-bb.3]
- Change the Default AWS Values.

## [1.2.0-bb.2]
- RapidFort Release 1.1.41-1 with Rapidfort helm chart version 1.2.0 for resource allocation.

## [1.2.0-bb.1]
- RapidFort Release 1.1.41-1 with Rapidfort helm chart version 1.2.1 along with updated values and istio config.

## [1.2.0-bb.0]
- RapidFort Release 1.1.41 with Rapidfort helm chart version 1.2.0

## [1.1.41-bb.0]
- RapidFort Release 1.1.40 Patch for RapidFort Deployment storage

## [1.1.40-bb.5]
- RapidFort Release 1.1.40 Patch for RapidFort Deployment

## [1.1.40-bb.4]
- RapidFort Release 1.1.40 Patch for RapidFort CLI Service

## [1.1.40-bb.3]
- RapidFort Release 1.1.40 Patch for Image Hardening

## [1.1.40-bb.2]
- RapidFort Release 1.1.40 Patch for Image Hardening

## [1.1.40-bb.1]
- RapidFort Release 1.1.40 Patch for RF-SCAN

## [1.1.40-bb.0]
- RapidFort Release 1.1.40

## [1.1.34-bb.1]
- Update Helm Chart for release patch for redis service creation

## [1.1.34-bb.0]
- Update Helm Chart for Release 1.1.34

## [1.1.30-bb.8]
- Update Helm chart for addning annotation using global service account

## [1.1.30-bb.7]
- Update Helm chart for addning annotation using global value

## [1.1.30-bb.6]
- Update Helm chart for MYSQL Address for keycloak

## [1.1.30-bb.5]
- Update Helm chart for adding annotation for service account iam role access

## [1.1.30-bb.5]
- Update Helm chart to support External DB.

## [1.1.30-bb.3]
- Update gatekeeper policy for runner service.

## [1.1.30-bb.2]
- Updating the README to point at the main RapidFort documentation.

## [1.1.30-bb.1]
- Updated Rapidfort Flux Helm Chart.

## [1.1.30-bb.0]
- Updated Rapidfort Bigbang Helmchart for supporting External RDS Database Connection.

## [1.1.29-bb.0]
- Updated Rapidfort Bigbang Helmchart for support to the fluxcd based deployment.

## [1.1.28-bb.0]
- Updated to RF 1.1.28

## [1.1.27-bb.0]
- Updated to RF 1.1.27

## [1.1.25-bb.0]
- Updated to RF 1.1.25
## [1.1.24-bb.0]
- Updated to RF 1.1.24

## [1.1.23-bb.0]
- Updated to RF 1.1.23

## [1.1.20-bb.0]
- Updated to RF 1.1.20

## [1.1.19-bb.0]
- Updated to RF 1.1.19
## [1.1.16-bb.0]
- Updated to RF 1.1.16
- Added new hostPath mount to runner (/tmp)

## [1.1.11-bb.1]

- Updated CODEOWNERS

## [1.1.11-bb.0]

- update RF to 1.1.11

## [1.1.10-bb.1]

- update mysql chart to 9.1.7
- update all  mysql images to 8.0.29
- change redis chart to bb redis upstream
- update all redis6 images to 6.2.7

## [1.1.10-bb.0]

- Update to RF 1.1.10

## [1.1.9-bb.11]
- Changed Keycloak dockerhub image (16.1.1) to IB image (18.0.0-legacy)

## [1.1.9-bb.10]

- PVC-ified RF microservices
  - Each chart gets its own pvc per volume needed, no sharing of volumes as of now
- Removed docker.sock from rf-scan
- Edited keycloak deployment to remove unused volume

## [1.1.9-bb.9]

- MySQL-BB chart now persists data properly and uses suggested IB default config values

## [1.1.9-bb.8]

- Updated Rapidfort to 1.1.9

## [1.1.8-bb.8]

### Added

- Added internal communication mode for runner
  - Change name of secret referenced by runner in values to `rf-runner-secret`
  - Added test values to allow runner to run in pipeline using internal comms
- Added netpols to support runner functionality, vdb and external
- Added fake values for CI
- Added util for syncing tags from amazon ecr to gitlab container registry

### Changed
- Reformatted values comments so they get imported into the helmdocs readme
- Optimized initContainer commands to speed up initContainer dependency chaining
  - added `--connect-timeout=10` flag to Keycloak initContainer mysql command
  - wrapped the rfapi initContainer redis command in the timeout command
  - added `--connect-timeout 10 --max-time 15` to runner initContainer curl
- Fixed a gitignore issue that stopped mysql-bb from working
  - This readded secrets.yaml to that chart
- Fixed the rfapi virtualservice ingress matching
- Changed initContainers to use IB images

## [1.1.8-bb.7] - 2022-05-19

Updated to RapidFort version 1.1.8

## [1.1.4-bb.7] - 2022-05-17

This is the first release of the chart using the proper RapidFort upstream chart collection.

### Changed 2022-05-16
- Moved to kpt upstream tracking
- Translated package to rapidfort parent chart from github
- Fixed netpols to work with containerPort 8080

### Changed 2022-05-04
- Replace existing redis chart with the BB approved package
- Reconfigure rfapi to use the new redis service endpoint

### Changed - 2022-04-15
- Replace existing mysql chart with upstream - use IB approved `8.0.28` image
- Modify `rf-secret` for configurable/templated `DB_URL`
- update keycloak initContainer
- Add configmap at parent chart for DB initialization
- Add job for external db initialization

### Changed
- Updated to latest charts from RF (Apr 7 2022)
- Fixed some weirdness around the authUrl value w/ volumes for keycloak
- Commented stub init container
- Fixed an invalid yaml key in runner values

### Added
- Support for BB pipelines
- Updated all `hpa`s to `v2beta2` from `v2beta1`
  - This required a slight yaml change in the `spec.metrics.resource`
- Value-ified all hardcoded references to images in templates
  - iso-master/deployment
  - keycloak/tests/test-connection
  - keycloak/deployment
  - redis/tests/test-connection
  - rfapi/tests/test-connection
  - rfvdb/tests/test-connection
  - rfvdb/deployment
  - runner/deployment
- Added .gitignore to .helmignore
- Updated parent `chart.yaml` to `apiVersion` `v2`
- Added dependencies on local charts to parent `chart.yaml`
- Overrode all subchart image locations to possible locations in approved registries
- Added initContainers back for proper internal dependency chaining
  - keycloak depends on mysql
- Added explanatory comments for all secrets
- Added sender email variable to work around SES stuff
- Added PVCs and references to them for iso-master, rf-scan
- Added RF_APP_ADMIN to customize email for RF deployment
- Added conditional for RF_DEBUG in runner
- Added rf-secret
  - Values come from the parent chart values
  - Keycloak stuff is all dependent on stuff already in init.yaml so no security issues (for now)
- Added capability to disable dependent charts
- Added new initContainer image references
- Added environment variable overrides where necessary
- Added a gitignore to keep secrets from being committed
