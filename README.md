# macOS Music Skill

This repo stores an AI agent skill for Apple Music.app on macOS.

The public interface is `scripts/commands`.
`scripts/applescripts` stores internal AppleScript backends and dictionary-aligned coverage.

## Installation

```bash
npx skills add vinitu/macos-music-skill
```

Or with [skills.sh](https://skills.sh):

```bash
skills.sh add vinitu/macos-music-skill
```

## Prerequisites

- macOS with Music.app
- Automation permission granted to your terminal app

## Public Interface

Run skill actions with:

```bash
scripts/commands/<entity>/<action>.sh [args...]
```

## Backend Map

- `scripts/commands/application/*` → AppleScript in `scripts/applescripts/application/*`
- `scripts/commands/library/*` → AppleScript in `scripts/applescripts/library/*`
- `scripts/commands/playback/*` → AppleScript in `scripts/applescripts/playback/*`
- `scripts/commands/playlist/*` → AppleScript in `scripts/applescripts/playlist/*`
- `scripts/commands/repeat/*` → AppleScript in `scripts/applescripts/repeat/*`
- `scripts/commands/shuffle/*` → AppleScript in `scripts/applescripts/shuffle/*`
- `scripts/commands/track/*` → AppleScript in `scripts/applescripts/track/*`
- `scripts/commands/volume/*` → AppleScript in `scripts/applescripts/volume/*`

## Command Surface

Application:

- `scripts/commands/application/eq-enabled.sh`
- `scripts/commands/application/mute.sh`
- `scripts/commands/application/player-position.sh`

Library:

- `scripts/commands/library/add-files.sh`

Playback:

- `scripts/commands/playback/back-track.sh`
- `scripts/commands/playback/fast-forward.sh`
- `scripts/commands/playback/next.sh`
- `scripts/commands/playback/pause.sh`
- `scripts/commands/playback/play-track.sh`
- `scripts/commands/playback/play.sh`
- `scripts/commands/playback/previous.sh`
- `scripts/commands/playback/resume.sh`
- `scripts/commands/playback/state.sh`
- `scripts/commands/playback/stop.sh`

Playlist:

- `scripts/commands/playlist/add-track.sh`
- `scripts/commands/playlist/create.sh`
- `scripts/commands/playlist/list.sh`
- `scripts/commands/playlist/tracks.sh`

Repeat:

- `scripts/commands/repeat/get.sh`
- `scripts/commands/repeat/set.sh`

Shuffle:

- `scripts/commands/shuffle/get.sh`
- `scripts/commands/shuffle/set.sh`

Track:

- `scripts/commands/track/current.sh`
- `scripts/commands/track/reveal.sh`
- `scripts/commands/track/search.sh`

Volume:

- `scripts/commands/volume/get.sh`
- `scripts/commands/volume/set.sh`

## Validation

```bash
make compile
make test
```
