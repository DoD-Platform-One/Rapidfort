# Changelog

Format: [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)


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
