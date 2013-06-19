# Script Name		: unmount_drives
# Author				: Craig Richards
# Created			: 25th November 2012
# Last Modified		: 
# Version			: 1.0

# Modifications		:  

# Description			: This unmounts my clone drives after the SuperDuper clone has finished

-- Eject the Drives

tell application "Finder"
	eject disk "iMac Clone"
	eject disk "Macbook Clone"
end tell

-- Display a growl notification

tell application "System Events"
	set isRunning to (count of (every process whose bundle identifier is "com.Growl.GrowlHelperApp")) > 0
end tell

if isRunning then
	tell application id "com.Growl.GrowlHelperApp"
		set the allNotificationsList to Â
			{"Drives Unmounted"}
		
		set the enabledNotificationsList to Â
			{"Drives Unmounted"}
		
		register as application Â
			"Unmount Clone Drives" all notifications allNotificationsList Â
			default notifications enabledNotificationsList Â
			icon of application "Script Editor"
		
		--       Send a Notification...
		notify with name Â
			"Drives Unmounted" title Â
			"Drives Unmounted" description Â
			"I have unmounted your clone drives." application name "Unmount Clone Drives"
	end tell
end if