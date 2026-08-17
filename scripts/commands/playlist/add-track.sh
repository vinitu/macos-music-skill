#!/usr/bin/env bash
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_lib/common.sh"

usage() {
  printf 'Usage: %s%s\n' "$(basename "$0")" ' <playlist-name> <track-name>'
}

main() {
  [[ $# -lt 2 ]] && json_fail "missing playlist name and/or track name"
  run_backend playlist add-track "$@"
}

main "$@"
