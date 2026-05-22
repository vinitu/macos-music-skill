-- List tracks in a playlist. argv: playlistName
on run argv
	if (count of argv) < 1 then
		return "Usage: tracks.applescript <playlist_name>"
	end if
	set plName to item 1 of argv

	tell application "Music"
		set pl to playlist plName
		set output to ""
		repeat with t in (every track of pl)
			set output to output & (name of t) & " | " & (artist of t) & linefeed
		end repeat
		return output
	end tell
end run
