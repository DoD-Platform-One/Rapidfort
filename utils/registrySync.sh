#!/bin/bash
pushd utils
skopeo sync --src yaml --dest docker skopeo-rf-sync.yaml repo1.dso.mil/big-bang/product/community/rapidfort/
popd
