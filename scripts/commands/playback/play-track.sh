#!/usr/bin/env bash
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_lib/common.sh"

usage() {
  printf 'Usage: %s%s\n' "$(basename "$0")" ' <track-name> [playlist-name]'
}

main() {
  [[ $# -lt 1 ]] && json_fail "missing track name"
  run_backend playback play-track "$@"
}

main "$@"
