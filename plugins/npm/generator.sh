#!/usr/bin/env bash

source "$DEPMAN_DIR/src/docker.sh"

BASE_IMAGE='node'
VERSIONS=(
  '12-alpine'
  '11-alpine'
  '10-alpine'
  '9-alpine'
  '8-alpine'
)

for VERSION in "${VERSIONS[@]}"
do
  depman_build_plugin_image npm $BASE_IMAGE $VERSION
done
