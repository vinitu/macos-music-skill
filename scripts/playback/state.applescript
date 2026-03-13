-- Get current player state (playing, paused, stopped) and current track name. One line each.
tell application "Music"
	set stateStr to "player state: " & (player state as string)
	set trackName to ""
	try
		set trackName to "current track: " & (name of current track)
	end try
	return stateStr & linefeed & trackName
end tell
