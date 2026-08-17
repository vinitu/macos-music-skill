#!/usr/bin/env bash
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_lib/common.sh"

usage() {
  printf 'Usage: %s%s\n' "$(basename "$0")" ' <path> [path2 ...]'
}

main() {
  [[ $# -lt 1 ]] && json_fail "missing file path(s)"
  run_backend library add-files "$@"
}

main "$@"
