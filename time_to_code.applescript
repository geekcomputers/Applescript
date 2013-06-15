# Script Name	: time_to_code
# Author			: Craig Richards
# Created		: 12th December 2012
# Last Modified	: 
# Version		: 1.0

# Modifications	: 

# Description		: When I need to write a new snippet of code, then this will close all the running applications and load the coding apps, plus play my playlist

-- Display a prompt to get the script title, this will also be the project name

-- This will get the list of the current open applications

tell application "System Events" to set openapps to name of every application process whose visible is true and name is not "Finder"

-- If you want to keep any apps open you can add them here

set keepapp to {""}

-- Close all the applications except finder and the ones listed above

repeat with closeapps in openapps
	if closeapps is not in keepapp then quit application closeapps
end repeat

-- Open my applications

tell application "CodeRunner" to activate
tell application "AppleScript Editor" to activate
tell application "iTunes" to play playlist "Developing"