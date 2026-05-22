-- Play previous track.
on run argv
	tell application "Music" to previous track
	return "previous"
end run
