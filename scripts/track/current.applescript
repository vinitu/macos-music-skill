-- Get current track details: name, artist, album, duration, position, state.
on run argv
	tell application "Music"
		set stateStr to player state as text
		set output to "state: " & stateStr & linefeed
		try
			set t to current track
			set output to output & "name: " & (name of t) & linefeed
			set output to output & "artist: " & (artist of t) & linefeed
			set output to output & "album: " & (album of t) & linefeed
			set output to output & "duration: " & (duration of t) & linefeed
			set output to output & "position: " & (player position) & linefeed
		end try
		return output
	end tell
end run
