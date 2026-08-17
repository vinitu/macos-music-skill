---
name: macos-music
description: Control Apple Music.app on macOS. Use for playback, library search, playlist management, volume, and shuffle/repeat.
---

# macOS Music

Use this skill when the task is about Apple Music.app on macOS.

## Main Rule

Use only `scripts/commands`.
Do not call `scripts/applescripts` directly.

## Requirements

- macOS with Music.app
- Automation permissions for the terminal (System Settings → Privacy & Security → Automation)
- `jq` (recommended; used to validate/shape JSON output)

## Public Interface

Run commands from `scripts/commands`:

- `scripts/commands/application/*`
- `scripts/commands/library/*`
- `scripts/commands/playback/*`
- `scripts/commands/playlist/*`
- `scripts/commands/repeat/*`
- `scripts/commands/shuffle/*`
- `scripts/commands/track/*`
- `scripts/commands/volume/*`

## Output Rules

- Commands return JSON by default. Every response is a JSON envelope: `{"success":true,"data":...}` on success or `{"success":false,"error":"..."}` on failure.
- Missing required arguments produce `{"success":false,"error":"missing ..."}` with a non-zero exit code, not raw AppleScript `Usage:` text.
- `track/reveal.sh` opens the app and returns `{"shown": true, ...}` style JSON.
- `--json`, `--plain`, and `--format=plain|json` are not supported. Output is always JSON.

## Commands

### Application

```bash
scripts/commands/application/eq-enabled.sh get
scripts/commands/application/eq-enabled.sh set true
scripts/commands/application/mute.sh get
scripts/commands/application/mute.sh set true
scripts/commands/application/player-position.sh get
scripts/commands/application/player-position.sh set 30
```

### Library

```bash
# Approval required: modifies the library.
scripts/commands/library/add-files.sh "/path/to/song.mp3"
scripts/commands/library/add-files.sh "/path/to/a.mp3" "/path/to/b.mp3"
```

### Playback

```bash
scripts/commands/playback/play.sh
scripts/commands/playback/pause.sh
scripts/commands/playback/resume.sh
scripts/commands/playback/stop.sh
scripts/commands/playback/next.sh
scripts/commands/playback/previous.sh
scripts/commands/playback/back-track.sh
scripts/commands/playback/fast-forward.sh
scripts/commands/playback/state.sh
scripts/commands/playback/play-track.sh "Bohemian Rhapsody"
scripts/commands/playback/play-track.sh "Bohemian Rhapsody" "Favourites"
```

### Playlist

```bash
scripts/commands/playlist/list.sh
scripts/commands/playlist/tracks.sh "Favourites"
# Approval required: creates a playlist.
scripts/commands/playlist/create.sh "CodexTest_Demo"
# Approval required: modifies a playlist.
scripts/commands/playlist/add-track.sh "Favourites" "Bohemian Rhapsody"
```

### Repeat

```bash
scripts/commands/repeat/get.sh
scripts/commands/repeat/set.sh off
scripts/commands/repeat/set.sh one
scripts/commands/repeat/set.sh all
```

### Shuffle

```bash
scripts/commands/shuffle/get.sh
scripts/commands/shuffle/set.sh true
scripts/commands/shuffle/set.sh false
```

### Track

```bash
scripts/commands/track/current.sh
scripts/commands/track/search.sh "Bohemian Rhapsody"
scripts/commands/track/search.sh "Queen" artist
scripts/commands/track/reveal.sh "Bohemian Rhapsody"
```

### Volume

```bash
scripts/commands/volume/get.sh
scripts/commands/volume/set.sh 50
```

## JSON Contract

Track object (from `track/current.sh`, fields present when a track is playing):

- `name` (string)
- `artist` (string)
- `album` (string)
- `duration` (number, seconds)
- `position` (number, seconds)

Playlist object:

- `name` (string)
- `tracks_count` (integer)

Volume envelope:

- `{"volume": N}` where N is 0–100

State envelope:

- `{"state": "playing"|"paused"|"stopped"}`

Scalar envelopes:

- `success/failure`: `{"success": true/false, "error": "..."}`

Backend output that is not already structured is wrapped as a JSON string inside `data`, e.g. `{"success":true,"data":"playing"}`.

## Safety Boundaries

- Playlist and library changes need explicit user approval before running: `playlist/create`, `playlist/add-track`, `library/add-files`.
- Use the `CodexTest_` prefix for any test playlists or test data, and clean them up afterwards.
- Internal AppleScript files (`scripts/applescripts/**`) are not public API; use `scripts/commands/**` only.
- Treat the music library as real user data. Never delete, move, overwrite, or export without explicit approval.