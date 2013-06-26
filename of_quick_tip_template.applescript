# Script Name	: of_quick_tip_template
# Author			: Craig Richards
# Created		: 9th December 2012
# Last Modified	: 11th December 2012
# Version		: 1.1

# Modifications	: 1.1 - CR - Added a feature to get the current user, and also create the folder in the dropbox folder to store the photos for the blog post

# Description		: This will create a new project titled with the name of the quick tip so I have all of the actions I need to do 

-- Display a prompt to get the script title, this will also be the project name

display dialog "Name of the Quick Tip" default answer ""
set postName to (text returned of result)

tell application "System Events"
	set currentUser to (name of current user)
end tell

-- Load OmniFocus and create the project

tell application "OmniFocus"
	tell default document
		-- Set the primary context for the project
		
		set pContext to first flattened context where its name = "Quick Tip"
		
		-- Set the individual task context
		
		set tContext to first flattened context where its name = "Computer"
		
		-- Set the folder to store the project
		
		set myFolder to first flattened folder where its name = "Quick Tips"
		
		-- Set the date to start the project to today's date
		
		set dateToday to (current date)
		
		-- Create the project in the given folder
		
		set MyProject1 to make new project with properties {name:postName, context:pContext} at end of project of myFolder
		tell MyProject1
			
			-- Create the tasks
			
			set MyAction to make new task with properties {name:"Folder Created in dropbox to store pictures", context:pContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Pictures downloaded and stored in folder", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Draft Started", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Post Finished", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Review and spell check", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Final Read through", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"usual final paragraph added", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Also like blog code", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"tags assigned", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"post scheduled", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Tinyurl created", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Bento Updated", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Tweets about post", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"G+ about post", context:tContext, start date:dateToday}
			set MyAction to make new task with properties {name:"Clean Up dropbox folder", context:tContext, start date:dateToday}
		end tell
	end tell
end tell

tell application "Finder"
	set mainFolder to "Macintosh HD:Users:craigdba:Dropbox:Geek Computers:Posts:quick tips" as alias
	make new folder at folder mainFolder with properties {name:postName, location:mainFolder}
end tell
