#!/usr/bin/env bash
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_lib/common.sh"

usage() {
  printf 'Usage: %s%s\n' "$(basename "$0")" ' <0-100>'
}

main() {
  [[ $# -lt 1 ]] && json_fail "missing volume (0-100)"
  run_backend volume set "$@"
}

main "$@"
