# macOS Music Skill

This repo stores an AI agent skill for Apple Music.app on macOS.

The public interface is `scripts/commands`.
`scripts/applescripts` stores internal AppleScript backends and dictionary-aligned coverage.

## Names

| Workspace repo | Install dir | Package name |
|---|---|
| `macos-music-skill/` | `~/.agents/skills/macos-music` | `apple-music` |

`skills check` and `skills update` may refer to this skill by the upstream package name `apple-music`.

## Installation

```bash
npx skills add vinitu/macos-music-skill
```

Or with [skills.sh](https://skills.sh):

```bash
skills.sh add vinitu/macos-music-skill
```

## Dependencies

- macOS with Music.app installed
- `osascript` (built into macOS)
- `jq` (recommended; used to validate and shape JSON output)
- Automation permission granted to your terminal app (System Settings → Privacy & Security → Automation)

## Public Interface

Run skill actions from the repo root with:

```bash
scripts/commands/<entity>/<action>.sh [args...]
```

All commands return a JSON envelope: `{"success":true,"data":...}` on success or `{"success":false,"error":"..."}` on failure.

## Examples

```bash
# Playback (read-only, safe)
scripts/commands/playback/play.sh
scripts/commands/playback/pause.sh
scripts/commands/playback/state.sh
scripts/commands/playback/next.sh

# Track search and current track
scripts/commands/track/search.sh "Bohemian Rhapsody"
scripts/commands/track/current.sh

# Volume
scripts/commands/volume/get.sh
scripts/commands/volume/set.sh 50

# Shuffle / repeat
scripts/commands/shuffle/set.sh true
scripts/commands/repeat/set.sh one

# Playlists
scripts/commands/playlist/list.sh
scripts/commands/playlist/tracks.sh "Favourites"

# Library mutations — require explicit user approval
scripts/commands/playlist/create.sh "CodexTest_Demo"
scripts/commands/playlist/add-track.sh "Favourites" "Bohemian Rhapsody"
scripts/commands/library/add-files.sh "/path/to/song.mp3"
```

## Known Limits

- AirPlay output is not implemented; there is no AirPlay command.
- Music.app automation may prompt for TCC permission on first use.
- Apple Music (streaming) tracks and local library tracks differ; some properties may be unavailable on subscription catalog items.
- Library mutations (`playlist/create`, `playlist/add-track`, `library/add-files`) modify real user data and need explicit approval.
- Use the `CodexTest_` prefix for test playlists/data and clean them up afterwards.

## Backend Map

- `scripts/commands/<entity>/*` → AppleScript in `scripts/applescripts/<entity>/*`
- `scripts/commands/_lib/common.sh` — shared helpers (`run_backend`, `json_wrap`, `json_fail`).

## Validation

```bash
make compile      # osacompile all AppleScript + bash -n all wrappers
make test         # dictionary contract + smoke (needs a real Music.app)
```