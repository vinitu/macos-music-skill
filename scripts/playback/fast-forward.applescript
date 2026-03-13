-- Fast forward within current track.
on run argv
	tell application "Music" to fast forward
	return "fast forward"
end run
