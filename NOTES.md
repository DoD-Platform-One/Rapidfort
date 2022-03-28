# RapidFort Notes

- ~~rf-version-info ConfigMap: Need information on data that is needed to populate this ConfigMap for deployments. TODO comments are in `chart/charts/<microservice>/templates/deployment.yaml`~~
  - Configmap info was provided by RF, was implemented in parent chart via the `configmap.yaml` and the `resources/.env` files, this may not be the best way to go about this, especially since the `.env` file contains what should be a secret, but it works for now.

- Commented out `nodeSelector` field in `chart/charts/backend/values.yaml`

- Created two PersistentVolumeClaims at `chart/charts/iso-master/templates/pvc.yaml`


