# Script Name		: avi_handbrake_conversion
# Author				: Craig Richards
# Created			: 23rd November 2012
# Last Modified		: 11th February 2013
# Version			: 2.0

# Modifications		: 2.0 - CR - Added the section at the end of the script to display the prompt box once the files have been created

# Description			: This will convert all AVI videos to mp4 format.  You will just need a folder to_convert on your desktop, drop the files in there and run the script

with timeout of (720 * 60) seconds
	tell application "System Events"
		set currentUser to (name of current user)
	end tell
	
	tell application "Finder"
		--Get all AVI and MKV files that have no label color yet, meaning it hasn't been processed
		set allFiles to every file of entire contents of folder "to_convert" of folder "Desktop" of folder currentUser of folder "Users" of startup disk whose ((name extension is "avi" or name extension is "mkv") and label index is 0)
		
		--Repeat for all files in above folder
		repeat with i from 1 to number of items in allFiles
			set currentFile to (item i of allFiles)
			
			try
				--Set to gray label to indicate processing
				set label index of currentFile to 7
				
				--Assemble original and new file paths
				set origFilepath to quoted form of POSIX path of (currentFile as alias)
				set newFilepath to (characters 1 thru -5 of origFilepath as string) & "mp4'"
				
				--Start the conversion
				set shellCommand to "nice /Applications/HandBrakeCLI -i " & origFilepath & " -o " & newFilepath & " -e x264 -b 4000 -a 1 -E faac -B 160 -R 48 -6 dpl2 -f mp4 --crop 0:0:0:0 -x level=40:ref=2:mixed-refs:bframes=3:weightb:subme=9:direct=auto:b-pyramid:me=umh:analyse=all:no-fast-pskip:filter=-2,-1 ;"
				do shell script shellCommand
				
				--Set the label to green in case file deletion fails
				set label index of currentFile to 6
				
				--Remove the old file
				set shellCommand to "rm -f " & origFilepath
				do shell script shellCommand
			on error errmsg
				--Set the label to red to indicate failure
				set label index of currentFile to 2
			end try
		end repeat
	end tell
end timeout

-- Display dialog box after the conversions

display dialog "The Script has finished - http://www.thegeekblog.co.uk" with icon 1 buttons {"OK", "Visit Site", "Send Email"}
if result = {button returned:"Visit Site"} then
	tell application "Safari"
		tell window 1
			set current tab to (make new tab with properties {URL:"http://www.thegeekblog.co.uk"})
		end tell
	end tell
else if result = {button returned:"Send Email"} then
	tell application "Mail"
		set theNewMessage to make new outgoing message with properties {subject:"Subject text", content:"Script Feedback", visible:true}
		tell theNewMessage
			make new to recipient at end of to recipients with properties {address:"feedback@geekcomputers.co.uk"}
			--send -- uncomment this line if you want the email to automatically send
		end tell
	end tell
end if