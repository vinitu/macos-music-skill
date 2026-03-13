-- Add track to playlist. argv: playlistName trackName
on run argv
	if (count of argv) < 2 then
		return "Usage: add-track.applescript <playlist_name> <track_name>"
	end if
	set plName to item 1 of argv
	set trackName to item 2 of argv

	tell application "Music"
		set pl to playlist plName
		set t to first track whose name is trackName
		duplicate t to pl
	end tell
	return "added"
end run
