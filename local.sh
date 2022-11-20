#/usr/bin/env bash

# This script is only intended to be used for local development on this project.
# It depends on a buildx node called "beta. You can create such an environment
# by executing "docker buildx create --name beta"

set -euo pipefail

export JQ_VERSION=$(curl -sSL https://api.github.com/repos/stedolan/jq/tags | jq -r "[.[].name] | .[0] | sub(\"jq-\";\"\")")
echo "Using jq version ${JQ_VERSION}"

docker buildx build \
  --push \
  --platform linux/arm64,linux/amd64 \
  --builder beta \
  --build-arg JQ_VERSION="${JQ_VERSION}" \
  -f Dockerfile \
  -t truemark/jq:beta-${JQ_VERSION} \
  -t truemark/jq:beta \
  .
IMAGE="truemark/jq:beta-${JQ_VERSION}" ARCH="amd64" FILE="jq-linux-amd64" ./getlayer.sh
IMAGE="truemark/jq:beta-${JQ_VERSION}" ARCH="arm64" FILE="jq-linux-arm64" ./getlayer.sh
