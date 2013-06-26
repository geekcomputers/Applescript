# Script Name		: iweb_fix
# Author				: Craig Richards
# Created			: 13th February 2013
# Last Modified		: 
# Version			: 1.0

# Modifications		:  

# Description			: This alters the defaults for iWeb so if it doesn't load your domain file, then run this script, then double click on your domain file and you should be good to go

do shell script "/usr/bin/defaults write com.apple.iWeb iWebDefaultsDocumentPath -boolean no"
delay 1
tell application "iWeb" to activate