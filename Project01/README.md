#-CS1XA3 Project01 - guoussed

##Usage 
 Execute this script from project root using chmod +x -CS1XA3/Project01/project_analyze.sh
### If chmod +x refuses to execute due to permission errors, call with bash in place of chmod +x
### With Possible Arguments 
####Argument 1: . (Supply single dot following filename)
####Argument 2: .. (Supply two dots following filename)
####Argument 3: ... (Supply three dots following filename)

##Feature 01: FIXME Log
Description:This feature checks to see if a file exists contain a list of all the files with #FIXME in their tail. 
If there is no fixme.log file, it creates one and if there is, it removes the old one and creates a new one
The program then checks the tail of all files in the specified path to see if #FIXME is present and if so, echoes
the name of the file with #FIXME to the fixme.log file
Execution: Execute this feature by calling bash project_analyze.sh .
Reference:
Some code was taken from
stackoverflow.com/questions/8509226/using-find-command-in-bash-script
cyberciti.biz/faq/bash-loop-over-file/
#Feature 02: File Type Count
Description: This feature takes an input from the user of the feature as an extension variable. The feature then searches for the number of extensions of that type using find and uses
<wc -c> to output the amount found
Execution: Execute this feature by calling bash project_analyze.sh ..
Reference:
Some code was taken from
stackoverflow.com/questions/8509226/using-find-command-in-bash-script
ss64.com/bash/wc.html
#Feature 03: Find Tag
Description:This feature requests a tag from the user using <read> and checks to see if a file by the name Tag.Log exists. 
If the Tag.Log file already exists, it removes the current one and creates a new one, if it does not, it creates a new one only.
It then creates a list of python files using <find> and iterates through the found python files to see if the tag appears using <grep>
If the tag appears, it echoes the tagged comment to Tag.log and does this for all other py files found
Execution: Execute this feature by calling bash project_analyze.sh ..
Reference:
stackoverflow.com/questions/8509226/using-find-command-in-bash-script
tldp.org/LDP/abs/html/special-chars.html
#CUSTOM IDEAS
##FILE CLEANUP AND ORDERING
Goes through each file in it's directory and checks to see if a sub directory exists for the file's extension type
If the extension sub directory doesn't exist, it creates it and moves the file to it. If it does, it simply moves the file to it
The file cleanup script ignores both project_analyze.sh and README.md but continues until all other files are in their appropriate sub directories
Ceases once only project_analyze.sh and README.md remain in the main directory and all other files have been sorted to sub directories
Reorganises the sub directories into alphabetical order
##
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
Moves all files from the current directory to the backup directory
creates a file and echoes the original filepaths of each .tmp file to the restore log
If Restore is selected
Goes through the restore log and moves the respective files to their path in the restore log
If the feature cannot locate a file by the name specified in the restore log, returns an error suggesting the file may have been deleted
https://stackoverflow.com/questions/4651437/how-do-i-set-a-variable-to-the-output-of-a-command-in-bash

# CS 1XA3 Project01 - <MyMacId>
## Usage
Execute this script from project root with:
chmod +x CS1XA3/Project01/project_analyze.sh
./CS1XA3/Project01/project_analyze arg1 arg2 ...
With possible arguments
arg1: ....
arg2: ....
....
## Feature 01
Description: this feature does ....
Execution: execute this feature by ...
Reference: some code was taken from [[https://someurl.com]]
## Feature 02
...
## Custom Feature SomeFeatur
