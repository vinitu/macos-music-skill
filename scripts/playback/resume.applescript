-- Resume playback.
on run argv
	tell application "Music" to resume
	return "resumed"
end run
