-- List user playlist names. One per line.
on run argv
	tell application "Music"
		set pls to (every user playlist)
		set output to ""
		repeat with p in pls
			set output to output & (name of p) & linefeed
		end repeat
		return output
	end tell
end run
