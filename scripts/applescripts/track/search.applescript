-- Search for tracks. argv: query [by name|artist|album]
on run argv
	if (count of argv) < 1 then
		return "Usage: search.applescript <query> [name|artist|album]"
	end if
	set query to item 1 of argv
	set searchBy to "name"
	if (count of argv) ≥ 2 then set searchBy to item 2 of argv

	tell application "Music"
		set found to {}
		if searchBy is "artist" then
			set found to (every track of library playlist 1 whose artist contains query)
		else if searchBy is "album" then
			set found to (every track of library playlist 1 whose album contains query)
		else
			set found to (every track of library playlist 1 whose name contains query)
		end if
		set output to ""
		repeat with t in found
			set output to output & (name of t) & " | " & (artist of t) & " | " & (album of t) & linefeed
		end repeat
		return output
	end tell
end run
