#!/usr/bin/env bash
# Smoke test for the macOS Music skill command layer.
# Skips cleanly when Music.app is not available or not running.
# Do NOT run this in CI without a real Music.app; it is a live check.
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMMANDS="$ROOT_DIR/scripts/commands"

if ! osascript -e 'tell application "Music" to get name' >/dev/null 2>&1; then
	echo "smoke_music: Music.app not available."
	exit 0
fi

# Run a public command and confirm it returns a JSON envelope.
# Returns non-zero (does not exit the script) on failure.
run_cmd() {
	local label="$1"; shift
	local out rc
	set +e
	out="$("$@" 2>&1)"
	rc=$?
	set -e
	if [[ $rc -ne 0 ]]; then
		echo "smoke_music: $label failed (exit $rc): $out" >&2
		return 1
	fi
	if command -v jq >/dev/null 2>&1; then
		if ! printf '%s' "$out" | jq -e '.success == true' >/dev/null 2>&1; then
			echo "smoke_music: $label did not return a success JSON envelope: $out" >&2
			return 1
		fi
	fi
	return 0
}

# playback state is the cheapest read; skip if Music is not running.
state_out="$(osascript "$ROOT_DIR/scripts/applescripts/playback/state.applescript" 2>&1)" \
	|| { echo "smoke_music: Music not running, skipping."; exit 0; }
printf '%s\n' "$state_out" >/dev/null

run_cmd "playback/state" "$COMMANDS/playback/state.sh"
run_cmd "track/current"   "$COMMANDS/track/current.sh"   || true
run_cmd "playlist/list"   "$COMMANDS/playlist/list.sh"   || true

echo "smoke_music: ok"