#!/usr/bin/env bash
set -euo pipefail

# quick devtools
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y \
  build-essential git python3 python3-pip ca-certificates curl wget

# clone emsdk into workspace root so it persists with the workspace
EMSDK_DIR="/workspaces/.emsdk"
if [ ! -d "$EMSDK_DIR" ]; then
  git clone https://github.com/emscripten-core/emsdk.git "$EMSDK_DIR"
  pushd "$EMSDK_DIR"
  ./emsdk install latest
  ./emsdk activate latest
  # ensure new shells will load emsdk env
  echo "source $EMSDK_DIR/emsdk_env.sh" >> /root/.bashrc
  popd
else
  echo "emsdk already exists at $EMSDK_DIR"
fi

# Optional: print emcc version to confirm
# shellcheck disable=SC1090
source "$EMSDK_DIR/emsdk_env.sh"
emcc --version || true

echo "Post-create finished. You may need to open a new terminal to get emsdk in PATH."
