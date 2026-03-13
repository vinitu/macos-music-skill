#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if ! osascript -e 'tell application "Music" to get name' >/dev/null 2>&1; then
	echo "smoke_music: Music.app not available."
	exit 0
fi

state_out="$(osascript "$ROOT_DIR/scripts/playback/state.applescript" 2>&1)" || { echo "smoke_music: Music not running, skipping."; exit 0; }
printf '%s\n' "$state_out" >/dev/null || { echo "smoke_music: playback state failed." >&2; exit 1; }

track_out="$(osascript "$ROOT_DIR/scripts/track/current.applescript" 2>&1)" || true
playlist_out="$(osascript "$ROOT_DIR/scripts/playlist/list.applescript" 2>&1)" || true
printf '%s\n' "$track_out" "$playlist_out" >/dev/null || true

echo "smoke_music: ok"
