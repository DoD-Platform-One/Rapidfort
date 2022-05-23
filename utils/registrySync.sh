#!/bin/bash
pushd utils
skopeo sync --src yaml --dest docker skopeo-rf-sync.yaml registry.dso.mil/platform-one/big-bang/apps/third-party/rapidfort/
popd