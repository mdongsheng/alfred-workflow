tell application "System Events"
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
				write text "${⌘}"
			end tell
		end tell
	end tell
end tell
