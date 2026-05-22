-- Pause playback.
on run argv
	tell application "Music" to pause
	return "paused"
end run
