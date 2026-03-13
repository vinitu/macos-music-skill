-- Stop playback.
on run argv
	tell application "Music" to stop
	return "stopped"
end run
