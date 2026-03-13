-- Set repeat mode. argv: off|one|all
on run argv
	if (count of argv) < 1 then
		return "Usage: set.applescript <off|one|all>"
	end if
	set modeStr to item 1 of argv

	tell application "Music"
		if modeStr is "one" then
			set song repeat to one
		else if modeStr is "all" then
			set song repeat to all
		else
			set song repeat to off
		end if
	end tell
	return "set"
end run
