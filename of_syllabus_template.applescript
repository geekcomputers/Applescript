# Script Name	: of_syllabus_template
# Author			: Craig Richards
# Created		: 01st July 2013
# Last Modified	: 
# Version		: 1.0

# Modifications	:  

# Description		: This will create a new project titled with the name of the student and all the steps when getting a license renewal 

-- Display a prompt to get the student name, this will also be the project name

display dialog "Name of the Student" default answer ""
set postName to (text returned of result)

tell application "System Events"
	set currentUser to (name of current user)
end tell

-- Load OmniFocus and create the project

tell application "OmniFocus"
	tell default document
		-- Set the primary context for the project
		
		set pContext to first flattened context where its name = "Karate club"
		
		-- Set the individual task context
		
		set tContext to first flattened context where its name = "Karate club"
		
		-- Set the folder to store the project
		
		set myFolder to first flattened folder where its name = "Karate Club"
		
		-- Set the date to start the project to today's date
		
		set dateToday to (current date)
		
		-- Create the project in the given folder
		
		set MyProject1 to make new project with properties {name:postName, context:pContext} at end of project of myFolder
		tell MyProject1
			
			-- Create the tasks
			
			set MyAction to make new task with properties {name:"Scan the license application/renewal form", context:pContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Enter/Check the details in Bento", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"File the scanned form in Evernote", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Place in Envelopes and give to Dad", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Wait for slip/license from Dad", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Update Bento with License Number", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Update Bento with License renewal date", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Pass the license back to the student", context:tContext, start date:dateToday}
		end tell
	end tell
end tell

