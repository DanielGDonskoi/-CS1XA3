#-CS1XA3 Project01 - guoussed

##Usage 
 Execute this script from project root using chmod +x -CS1XA3/Project01/project_analyze.sh
 If chmod +x refuses to execute due to permission errors, call with bash in place of chmod +x
 With Possible Arguments 
Argument 1: . (Supply single dot following filename)
Argument 2: .. (Supply two dots following filename)
Argument 3: ... (Supply three dots following filename)

##Feature 01: FIXME Log
#
##TAKEN CODE

#CUSTOM IDEAS
##FILE CLEANUP AND ORDERING
Goes through each file in it's directory and checks to see if a sub directory exists for the file's extension type
If the extension sub directory doesn't exist, it creates it and moves the file to it. If it does, it simply moves the file to it
The file cleanup script ignores both project_analyze.sh and README.md but continues until all other files are in their appropriate sub directories
Ceases once only project_analyze.sh and README.md remain in the main directory and all other files have been sorted to sub directories
Reorganises the sub directories into alphabetical order
##PLANNED IMPLEMENTATION
#SWITCH TO EXECUTABLE
Utilises built in find git command to find all scripts ending in .sh(Same as in File type count)
Assigns results of find command to variable using command substitution
Checks to see if a file by the name of permissions.log exists using -f, if not, creates it, if so deletes and creates a new one.
Uses the read command to get user input in the form of either "Change" or "Restore"
If returning Change 
Takes the original permissions of the files and echoes them to the permissions.log file
Uses chmod to alter permission so that only the people who can write to the .sh files can execute them
If returning Restore
Takes the permissions from permissions.log line by line and restores the original permissions of the existing .sh files

#BACKUP AND RESTORE
Prompts the user for a an input of <"Backup"> or <"Restore"> using the read command
If Backup is selected
A new empty directory called backup is created, if the directory exists, the directory is removed and a new one is created
The find command is utilised to find all files concluding in .tmp

