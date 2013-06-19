# Script Name	: evernote_create_logbooks
# Author			: Craig Richards
# Created		: 8th December 2012
# Last Modified	: 
# Version		: 1.0

# Modifications	:  

# Description		: This creates my logbook entry for the day for when working at a site 

tell application "Evernote"
	set myNotebook to notebook "Work Log"
	set tDate to short date string of (current date) as string
	set noteTitle to short date string of (current date) as string
	create note title noteTitle with text " " notebook myNoteBook tags {"logbooks", "Work"}
	synchronize
	delay 20
	quit
end tell