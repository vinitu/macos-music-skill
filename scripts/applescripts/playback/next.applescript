-- Play next track.
on run argv
	tell application "Music" to next track
	return "next"
end run
