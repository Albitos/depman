#!/usr/bin/env bash

source "$DEPMAN_DIR/src/docker.sh"

BASE_IMAGE='php'
VERSIONS=(
  '5.6-cli-alpine'
  '7.0-cli-alpine'
  '7.1-cli-alpine'
  '7.2-cli-alpine'
  '7.3-cli-alpine'
  '7.4-cli-alpine'
  '8.0-rc-cli-alpine'
)

for VERSION in "${VERSIONS[@]}"
do
  depman_build_plugin_image composer $BASE_IMAGE $VERSION
done
