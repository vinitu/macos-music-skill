-- Get or set player position (seconds). argv: get|set [seconds]
on run argv
	if (count of argv) < 1 then
		return "Usage: player-position.applescript <get|set> [seconds]"
	end if
	set cmd to item 1 of argv

	tell application "Music"
		if cmd is "set" and (count of argv) ≥ 2 then
			set player position to (item 2 of argv) as real
			return "set"
		else
			return (player position) as text
		end if
	end tell
end run
