# macOS Music Skill

This repo stores a skill for macOS Music.app integration via AppleScript.

## Installation

```bash
npx skills add vinitu/macos-music-skill
```

Or with [skills.sh](https://skills.sh):

```bash
skills.sh add vinitu/macos-music-skill
```

## Scope

- Playback controls: play, pause, stop, next, previous, seek.
- Get current track info: name, artist, album, duration, position.
- Search the library by name, artist, album, or genre.
- Manage playlists: list, create, add tracks, play.
- Volume control.
- Shuffle and repeat mode.
- AirPlay output selection.

## Prerequisites

- macOS 10.15+ (Catalina or later) with Music.app
- Automation permission granted to your terminal (System Settings > Privacy & Security > Automation)

## How To Use

From the skill directory (or path where scripts are installed):

```bash
# Start playback
osascript scripts/playback/play.applescript
# Current track name, artist, album, duration, position
osascript scripts/track/current.applescript
# Search library by artist (name|artist|album)
osascript scripts/track/search.applescript "Beatles" artist
# Set volume 0–100
osascript scripts/volume/set.applescript 50
# List all user playlists
osascript scripts/playlist/list.applescript
```

For the full command set and examples, see `SKILL.md` and scripts under `scripts/`.

## Troubleshooting

| Issue | Solution |
|-------|----------|
| "Not authorized to send Apple events" | Grant Automation permission to terminal |
| No tracks found | Ensure your library is synced / not empty |
| AirPlay device not listed | Check device is on the same network |
| Commands hang or timeout | Restart Music.app and retry |
