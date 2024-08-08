#!/bin/bash
cd "$(readlink -f "$(dirname "$0")/..")"

(cd "scripts" && npm i)
(cd "website" && npm i)
(cd "scripts" && npx tsx combine.ts)

if [[ -n $GITHUB_REPOSITORY ]]; then
  wget --quiet "https://github.com/$GITHUB_REPOSITORY/releases/download/cache/cache.txz" -O - | tar -xJvf -
fi
