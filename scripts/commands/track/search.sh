#!/usr/bin/env bash
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_lib/common.sh"

usage() {
  printf 'Usage: %s%s\n' "$(basename "$0")" ' <query> [name|artist|album]'
}

main() {
  [[ $# -lt 1 ]] && json_fail "missing search query"
  run_backend track search "$@"
}

main "$@"
