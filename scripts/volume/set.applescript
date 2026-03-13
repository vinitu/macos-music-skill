-- Set volume. argv: 0-100
on run argv
	if (count of argv) < 1 then
		return "Usage: set.applescript <0-100>"
	end if
	set vol to (item 1 of argv) as integer

	tell application "Music"
		set sound volume to vol
	end tell
	return "set"
end run
