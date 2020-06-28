#!/usr/bin/env bash

source "$DEPMAN_DIR/src/docker.sh"

BASE_IMAGE='python'
VERSIONS=(
  '3.8-alpine'
  '3.7-alpine'
  '3.6-alpine'
  '3.5-alpine'
)

for VERSION in "${VERSIONS[@]}"
do
  depman_build_plugin_image pip $BASE_IMAGE $VERSION
done
