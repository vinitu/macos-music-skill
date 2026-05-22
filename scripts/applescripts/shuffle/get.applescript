-- Get shuffle mode (true/false).
on run argv
	tell application "Music"
		return (shuffle enabled) as text
	end tell
end run
