-- Set shuffle. argv: true|false
on run argv
	if (count of argv) < 1 then
		return "Usage: set.applescript <true|false>"
	end if
	set val to (item 1 of argv is "true")

	tell application "Music"
		set shuffle enabled to val
	end tell
	return "set"
end run
