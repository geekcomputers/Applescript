# Script Name	: evernote_create_logbooks
# Author			: Craig Richards
# Created		: 8th December 2012
# Last Modified	: 24th September 2013
# Version		: 1.1

# Modifications	: 1.1 - 24/09/13 - CR - Had to change the line tell application "evernote" to tell application id "com.evernote.evernote" since the upgrade to mountain lion

# Description		: This creates my logbook entry for the day for when working at Tulletts 

tell application id "com.evernote.evernote"
	set myNotebook to notebook "Tulletts log"
	set tDate to short date string of (current date) as string
	set noteTitle to short date string of (current date) as string
	create note title noteTitle with text " " notebook myNotebook tags {"logbooks", "Tulletts"}
	synchronize
	delay 30
	quit
end tell