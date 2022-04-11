# Changelog

Format: [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

## [Unreleased]

### Changed
- Updated to latest charts from RF (Apr 7 2022)

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