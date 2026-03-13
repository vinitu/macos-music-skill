-- Get repeat mode: off, one, all.
on run argv
	tell application "Music"
		return (song repeat) as text
	end tell
end run
