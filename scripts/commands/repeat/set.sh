#!/usr/bin/env bash
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_lib/common.sh"

usage() {
  printf 'Usage: %s%s\n' "$(basename "$0")" ' <off|one|all>'
}

main() {
  [[ $# -lt 1 ]] && json_fail "missing repeat mode (off|one|all)"
  run_backend repeat set "$@"
}

main "$@"
