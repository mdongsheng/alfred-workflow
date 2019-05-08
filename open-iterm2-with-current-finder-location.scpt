set finderPath to ""
set finderPosition to {}

tell application "Finder"
	try
		set finderFolder to (folder of the front window as alias)
	on error
		set finderFolder to (path to home folder as alias)
	end try
	set finderPath to quoted form of POSIX path of finderFolder
	
	if not (exists (window 1 of process "iTerm2")) then
		tell application "iTerm"
			create window with default profile
		end tell
	end if
	
	tell application "iTerm"
		activate
		
		tell current window
			create tab with default profile
			
			tell current session
				write text "cd " & finderPath
			end tell
		end tell
		
		tell application "Finder"
			set finderPosition to bounds of window of desktop
		end tell
		
		tell application "iTerm"
			set bounds of window 1 to finderPosition
		end tell
	end tell
end tell

