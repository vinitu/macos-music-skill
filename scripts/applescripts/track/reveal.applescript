-- Reveal track in Music app. argv: trackName
on run argv
	if (count of argv) < 1 then
		return "Usage: reveal.applescript <track_name>"
	end if
	set trackName to item 1 of argv

	tell application "Music"
		set t to first track whose name is trackName
		reveal t
	end tell
	return "revealed"
end run
