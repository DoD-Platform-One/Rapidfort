# Changelog

Format: [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

## [Unreleased]

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