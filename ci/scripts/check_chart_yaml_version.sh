#!/usr/bin/env bash

set -o errexit

CHART=$1

git fetch origin main:main
VERSION_PR=$(yq .version charts/$CHART/Chart.yaml)
git checkout main
VERSION_MAIN=$(yq .version charts/$CHART/Chart.yaml)
if [ "$VERSION_PR" == "$VERSION_MAIN" ]; then
  echo "chart.yaml version has not been updated!"
  exit 1
else
  echo "chart.yaml version has been updated."
fi