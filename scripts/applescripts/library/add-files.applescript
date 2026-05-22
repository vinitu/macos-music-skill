-- Add files to library. argv: POSIX_path [path2 ...]
on run argv
	if (count of argv) < 1 then
		return "Usage: add-files.applescript <path> [path2 ...]"
	end if

	tell application "Music"
		repeat with pathStr in argv
			add (POSIX file pathStr as alias)
		end repeat
	end tell
	return "added"
end run
