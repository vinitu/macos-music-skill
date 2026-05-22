-- Get or set EQ enabled. argv: get|set [true|false]
on run argv
	if (count of argv) < 1 then
		return "Usage: eq-enabled.applescript <get|set> [true|false]"
	end if
	set cmd to item 1 of argv

	tell application "Music"
		if cmd is "set" and (count of argv) ≥ 2 then
			set eq enabled to (item 2 of argv is "true")
			return "set"
		else
			return (eq enabled) as text
		end if
	end tell
end run
