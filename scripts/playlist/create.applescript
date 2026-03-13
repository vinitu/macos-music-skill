-- Create a new playlist. argv: playlistName
on run argv
	if (count of argv) < 1 then
		return "Usage: create.applescript <playlist_name>"
	end if
	set plName to item 1 of argv

	tell application "Music"
		make new user playlist with properties {name:plName}
	end tell
	return "created"
end run
