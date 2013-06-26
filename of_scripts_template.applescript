# Script Name	: of_scripts_template
# Author			: Craig Richards
# Created		: 5th December 2012
# Last Modified	: 11th June 2013
# Version		: 1.2

# Modifications	: 1.1 - 21/05/13 - CR Added a line so we add a task to include line to sqlite setup as well
#				: 1.2 - 11/06/2013 - CR - Added a new line to check the headers are correct in the script

# Description		: This will create a new project titled with the name of the script and have all of the actions so I can record/track/document my scripts 

-- Display a prompt to get the script title, this will also be the project name

display dialog "Name of the script" default answer ""
set scriptName to (text returned of result)

-- Load OmniFocus and create the project

tell application "OmniFocus"
	tell default document
		-- Set the primary context for the project
		
		set pContext to first flattened context where its name = "Development"
		
		-- Set the individual task context
		
		set tContext to first flattened context where its name = "Computer"
		
		-- Set the folder to store the project
		
		set myFolder to first flattened folder where its name = "Personal"
		
		-- Set the date to start the project to today's date
		
		set dateToday to (current date)
		
		-- Create the project in the given folder
		
		set MyProject1 to make new project with properties {name:scriptName, context:pContext} at end of project of myFolder
		tell MyProject1
			
			-- Create the tasks
			
			set MyAction to make new task with properties {name:"Script tested", context:pContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Fully commented", context:pContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Headers added", context:pContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Copied to right directory in the scripts directory", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Copied to the github directory", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Script copied into evernote", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Note location copied to main page in Scripts note in evernote", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Edited the mysql_setup.sql to include the new script", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Edited the sqlite_setup.sql to include the new script", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Inserted the record into the databases", context:tContext, start date:dateToday}
		end tell
	end tell
end tell