#!/usr/bin/env bash

set -x
VERSION=`jq -r .version packages/saltcorn-data/package.json`
echo $VERSION
docker build -t saltcorn/saltcorn:latest -f Dockerfile.release .
docker push saltcorn/saltcorn:latest
docker build -t saltcorn/saltcorn:$VERSION -f Dockerfile.release .
docker push saltcorn/saltcorn:$VERSION
docker build -t saltcorn/saltcorn:dev -f Dockerfile.dev .
docker push saltcorn/saltcorn:dev
docker build -t saltcorn/saltcorn:pyml -f Dockerfile.pyml .
docker push saltcorn/saltcorn:pyml