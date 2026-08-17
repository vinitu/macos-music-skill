#!/usr/bin/env bash
# Shared helpers for macOS Music skill command wrappers.
# Public commands live under scripts/commands/<entity>/<action>.sh and delegate
# to internal AppleScript backends under scripts/applescripts/<entity>/<action>.applescript.
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"

# Emit a failure envelope and exit non-zero.
json_fail() { local msg="$1"; printf '{"success":false,"error":"%s"}\n' "$msg"; exit 1; }

# Emit a success envelope with a pre-built JSON payload (default {}).
json_ok() { local payload="${1:-{}}"; printf '{"success":true,"data":%s}\n' "$payload"; }

# Fail when a required value is empty.
require_arg() { local v="${1:-}" l="$2"; [[ -z "$v" ]] && json_fail "missing ${l}"; }

# Resolve the AppleScript backend path for an entity/action.
backend_script() { local e="$1" a="$2"; printf '%s/scripts/applescripts/%s/%s.applescript' "$ROOT_DIR" "$e" "$a"; }

# JSON-encode a raw string. Uses jq when available; falls back to a basic escaper.
json_escape() {
	local raw="$1"
	if command -v jq >/dev/null 2>&1; then
		printf '%s' "$raw" | jq -Rs .
	else
		local out="${raw//\\/\\\\}"
		out="${out//\"/\\\"}"
		out="${out//$'\n'/\\n}"
		out="${out//$'\r'/\\r}"
		out="${out//$'\t'/\\t}"
		printf '"%s"' "$out"
	fi
}

# Wrap backend output in a JSON envelope. If the output is itself valid JSON,
# embed it raw as "data"; otherwise wrap it as a JSON string.
json_wrap() {
	local raw="$1"
	if command -v jq >/dev/null 2>&1 && printf '%s' "$raw" | jq -e . >/dev/null 2>&1; then
		printf '{"success":true,"data":%s}\n' "$raw"
	else
		printf '{"success":true,"data":%s}\n' "$(json_escape "$raw")"
	fi
}

# Run an AppleScript backend and wrap its output as JSON.
# Usage: run_backend <entity> <action> [args...]
run_backend() {
	local e="$1" a="$2"; shift 2
	local sp; sp="$(backend_script "$e" "$a")"
	[[ -f "$sp" ]] || json_fail "backend script not found: ${sp}"
	local out rc
	set +e
	out="$(osascript "$sp" "$@" 2>&1)"
	rc=$?
	set -e
	if [[ $rc -eq 0 ]]; then
		json_wrap "$out"
	else
		json_fail "$out"
	fi
}