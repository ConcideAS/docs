#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

export PUPPETEER_SKIP_DOWNLOAD=true

echo "node $(node -v), npm $(npm -v); mint supports node 20.17 to 24 and refuses node 25"

install_mint() {
  if [ -w "$(npm prefix -g)" ]; then
    npm install -g mint --no-fund --no-audit
  elif sudo -n true 2>/dev/null; then
    sudo -n env "PATH=$PATH" PUPPETEER_SKIP_DOWNLOAD=true npm install -g mint --no-fund --no-audit
  else
    echo "the global npm prefix $(npm prefix -g) is not writable and there is no passwordless sudo" >&2
    return 1
  fi
}

install_mint
echo "installed mint $(mint --version)"

if mint validate; then
  echo "mint validate passed and the Mintlify preview client is cached in ~/.mintlify"
else
  echo "mint validate failed; the CLI is installed, but fix the error above before you trust mint dev or mint broken-links" >&2
fi
