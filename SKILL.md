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

- `scripts/commands/library/*`
- `scripts/commands/playlist/*`
- `scripts/commands/track/*`

## Commands

### Library

```bash
scripts/commands/library/add-files.sh
```

### Playlist

```bash
scripts/commands/playlist/add-track.sh
scripts/commands/playlist/create.sh
scripts/commands/playlist/list.sh
scripts/commands/playlist/tracks.sh
```

### Track

```bash
scripts/commands/track/current.sh
scripts/commands/track/reveal.sh
scripts/commands/track/search.sh
```

## Safety Boundaries

- Playlist and library changes need approval.
- Internal AppleScript files are not public API.
