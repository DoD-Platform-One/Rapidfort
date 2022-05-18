# Changes needed for Big Bang

Due to how BB uses RapidFort and the differences in environments there are some changes to templates and values that needed to be made.

## Parent Chart

### Values

- All image locations/tags are overridden at the parent chart to refer to approved tags/registries. This modification is in the `values.yaml` file. Any place that refers to an image/tag was modified by us.
- Values sub-section for RF mysql was replaced with values sub-section for mysql-bb
- Values sub-section for RF redis was replaced with values sub-section for redis-bb
- Added a Big Bang values section at bottom. All values under `#Big Bang Values` were added by us to facilitate BB functionality.

### Chart.yaml

- Reference to the RF mysql chart was removed and replaced with a reference to the mysql-bb chart
- Reference to the RF redis chart was removed and replaced with a reference to the redis-bb chart
- Added dependecy on gluon for BB testing
- Replaced the chart version with the BB mandated form.

### Templates

- New Templates
  - Added the `external-db-job.yaml` for mysql-bb
  - Added the `db-init-configmap.yaml` for mysql-bb
- Edited RF Templates
  - Modified the default value for the `DB_URL` in the `secret.yaml` file. MySQL from BB doesn't allow remote connections from root so this was changed to default to the mysql:mysql user/pass.
- The _helpers.tpl file was replaced with our custom version that supports BB

## Aggregator

No changes at this time.

## Backend

No changes at this time.

## Frontrow

No changes at this time.

## ISO-Master

No changes at this time.

## Keycloak

### Helm Test

The helm test from RF was removed as it was an artifact from helm initialization and served no purpose.

### InitContainer

The init-mysql initContainer script incorrectly referred to the `db.user` value as `db.username`. This was corrected.

## RF-SCAN

### Helm Test

The helm test from RF was removed as it was an artifact from helm initialization and served no purpose.

## RFAPI

### Helm Test

The helm test from RF was removed as it was an artifact from helm initialization and served no purpose.

## RFPUBSUB

No changes at this time.

## Runner

### Values

The Runner values file had an old reference to a defunct image registry for the initContainer, even though this is overridden via the parent chart it was fixed here to reference RapidFort's public ecr registry.
