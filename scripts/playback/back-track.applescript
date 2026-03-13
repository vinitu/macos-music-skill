-- Rewind within current track.
on run argv
	tell application "Music" to back track
	return "back"
end run
