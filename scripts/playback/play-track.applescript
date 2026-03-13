-- Play a track by name. argv: trackName [playlistName]
on run argv
	if (count of argv) < 1 then
		return "Usage: play-track.applescript <track_name> [playlist_name]"
	end if
	set trackName to item 1 of argv

	tell application "Music"
		if (count of argv) ≥ 2 then
			set plName to item 2 of argv
			play (first track of playlist plName whose name is trackName)
		else
			play (first track whose name is trackName)
		end if
	end tell
	return "playing"
end run
