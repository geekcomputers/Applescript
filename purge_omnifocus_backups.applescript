# Script Name		: purge_omnifocus_backups
# Author				: Craig Richards
# Created			: 18th November 2012
# Last Modified		: 
# Version			: 1.0

# Modifications		:  

# Description			: This finds all the omnifocus backups older than 10 days and places them into the trash can

-- Set the age of files that you want to purge from your downloads folder
set modDate to (10)

-- Get current user's name
tell application "System Events"
	set currentUser to (name of current user)
end tell

-- Check for backups and move files to the trash that are older than N days.
tell application "Finder"
	try
		delete (every item of folder "OmniFocus Backups" of folder "Documents" of folder currentUser of folder "Users" of startup disk whose modification date is less than ((current date)) - modDate * days)
	end try
	
end tell