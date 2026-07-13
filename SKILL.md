---
name: macos-music
description: Control Apple Music.app on macOS. Use for playback, library search, playlist management, volume, shuffle/repeat, and AirPlay output.
---

# macOS Music

Use this skill when the task is about Apple Music.app on macOS.

## Main Rule

Use only `scripts/commands`.
Do not call `scripts/applescripts` directly.

## Requirements

- macOS with Music.app
- Automation permissions for the terminal.

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

## Commands

### Application

```bash
scripts/commands/application/eq-enabled.sh
scripts/commands/application/mute.sh
scripts/commands/application/player-position.sh
```

### Library

```bash
scripts/commands/library/add-files.sh
```

### Playback

```bash
scripts/commands/playback/back-track.sh
scripts/commands/playback/fast-forward.sh
scripts/commands/playback/next.sh
scripts/commands/playback/pause.sh
scripts/commands/playback/play-track.sh
scripts/commands/playback/play.sh
scripts/commands/playback/previous.sh
scripts/commands/playback/resume.sh
scripts/commands/playback/state.sh
scripts/commands/playback/stop.sh
```

### Playlist

```bash
scripts/commands/playlist/add-track.sh
scripts/commands/playlist/create.sh
scripts/commands/playlist/list.sh
scripts/commands/playlist/tracks.sh
```

### Repeat

```bash
scripts/commands/repeat/get.sh
scripts/commands/repeat/set.sh
```

### Shuffle

```bash
scripts/commands/shuffle/get.sh
scripts/commands/shuffle/set.sh
```

### Track

```bash
scripts/commands/track/current.sh
scripts/commands/track/reveal.sh
scripts/commands/track/search.sh
```

### Volume

```bash
scripts/commands/volume/get.sh
scripts/commands/volume/set.sh
```

## Output Rules

- Commands return JSON by default unless noted otherwise.
- `show.sh` opens the app and returns a small JSON envelope.
- `--json`, `--plain`, and `--format=plain|json` are not supported.

## JSON Contract

Track object:

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

## Safety Boundaries

- Playlist and library changes need approval.
- Internal AppleScript files are not public API.
