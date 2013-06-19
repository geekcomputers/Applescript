# Script Name	: my_timer
# Author			: Craig Richards
# Created		: 28th May 2013
# Last Modified	: 
# Version		: 1.0

# Modifications	:  

# Description		: This sets up the timer with custom minutes 

-- Display a prompt to get the minutes you want to set it for

display dialog "Minutes" default answer ""
set minutes to (text returned of result)

-- Activate the application

tell application "TimerByTen" to activate

--Sleep while the application loads

delay 5

-- Set the application to run for the minutes given

tell application "System Events"
	keystroke "0"
	repeat minutes times
		keystroke "m"
	end repeat
	keystroke space
end tell
