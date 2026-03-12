# Apple Music Skill

This repo stores a skill for Apple Music.app integration on macOS using AppleScript.

## Installation

Install with `skills.sh`:

```bash
skills.sh add vinitu/apple-music-skill
```

If you use the npm installer instead:

```bash
npx skills add vinitu/apple-music-skill
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

```bash
# Play / pause
osascript -e 'tell application "Music" to playpause'

# Get current track
osascript -e 'tell application "Music" to get name of current track'

# Search library
osascript -e 'tell application "Music" to get name of every track of playlist "Library" whose artist contains "Beatles"'

# Set volume
osascript -e 'tell application "Music" to set sound volume to 50'

# List playlists
osascript -e 'tell application "Music" to get name of every user playlist'
```

For the full command set and examples, see `SKILL.md`.

## Troubleshooting

| Issue | Solution |
|-------|----------|
| "Not authorized to send Apple events" | Grant Automation permission to terminal |
| No tracks found | Ensure your library is synced / not empty |
| AirPlay device not listed | Check device is on the same network |
| Commands hang or timeout | Restart Music.app and retry |
