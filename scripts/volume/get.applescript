-- Get current volume (0-100).
on run argv
	tell application "Music"
		return (sound volume) as text
	end tell
end run
