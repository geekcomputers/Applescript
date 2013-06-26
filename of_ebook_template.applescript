# Script Name	: of_ebook_template
# Author			: Craig Richards
# Created		: 5th December 2012
# Last Modified	: 
# Version		: 1.0

# Modifications	:  

# Description		: This will create a new project titled with the name of the ebook and have all of the actions, so I can record the detail when I purchase a new book

-- Display a prompt to get the book title, this will also be the project name

display dialog "Name of the ebook" default answer ""
set ebookName to (text returned of result)

-- Load OmniFocus and create the project

tell application "OmniFocus"
	tell default document
		-- Set the primary context for the project
		
		set pContext to first flattened context where its name = "Computer"
		
		-- Set the individual task context
		
		set tContext to first flattened context where its name = "iMac"
		
		-- Set the folder to store the project
		
		set myFolder to first flattened folder where its name = "Personal"
		
		-- Set the date to start the project to today's date
		
		set dateToday to (current date)
		
		-- Create the project in the given folder
		
		set MyProject1 to make new project with properties {name:ebookName, context:pContext} at end of project of myFolder
		tell MyProject1
			
			-- Create the tasks
			
			set MyAction to make new task with properties {name:"Sync With Dropbox", context:pContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Copied epub in iTunes", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Copied pdf in iTunes", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Synced to iPad", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Copied mobi to Kindle Contect", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Updated mysql_setup.sql", context:pContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Inserted the record into the database", context:tContext, start date:dateToday}
		end tell
	end tell
end tell