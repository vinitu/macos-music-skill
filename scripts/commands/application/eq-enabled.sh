#!/usr/bin/env bash
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_lib/common.sh"

usage() {
  printf 'Usage: %s%s\n' "$(basename "$0")" ' <get|set> [true|false]'
}

main() {
  [[ $# -lt 1 ]] && json_fail "missing eq-enabled command (get|set)"
  run_backend application eq-enabled "$@"
}

main "$@"
