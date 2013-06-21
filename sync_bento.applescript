# Script Name		: sync_bento
# Author				: Craig Richards
# Created			: 13th February 2013
# Last Modified		: 21st June 2013
# Version			: 1.1

# Modifications		:  1.1 - 21/06/13 - CR - added a coouple of lines for it to hide bento, wait while I sync then close bento and switch off the wifi again

# Description			: This turns on my Airport Card, then loads bento and enters my password

-- Turn the wifi airport card on

do shell script "networksetup -setairportpower en1 on"

--Set the Variable to hold my Bento Password, with the password it didn't seem to like the Capital M so I have put it in twice as it ignores the first one

set pword to "password"

--open Bento

tell application "Bento" to activate

--Sleep while the application loads

delay 5

--Then Enter the password and tab through to the Submit button and click on it

tell application "System Events"
	keystroke pword
	keystroke tab
	keystroke tab
	keystroke tab
	keystroke space
end tell

-- Hide the Bento Screen - 1.1 

tell application "System Events"
	set visible of every process whose visible is true and name is "Bento" to false
end tell

-- Wait for one minute - 1.1

delay 60

-- Quit Bento -1.1

tell application "Bento" to quit

-- Turn the wifi off - 1.1

do shell script "networksetup -setairportpower en1 off"
