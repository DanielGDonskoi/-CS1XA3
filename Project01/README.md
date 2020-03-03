 
# CS 1XA3 Project01 - guoussed
## Usage
Execute this script from project root with:
chmod +x CS1XA3/Project01/project_analyze.sh
./CS1XA3/Project01/project_analyze arg1 arg2 ...\
With possible arguments after project_analyze.sh\
arg1: . (Single Period)(Calls FIXME Log)\
arg2: .. (Two Periods) (Calls File Extension Count)\
arg3: ... (Three Periods) (Calls Tag Log)\
....
## Feature 01: Fixme Log
Description: this feature finds all files with #FIXME in their final line and adds the names of all those files to a file named fixme.log\
Execution: execute this feature by calling project_analyze.sh . (Single character after)\
Reference: some code was taken from stackoverflow.com/questions/8509226/using-find-command-in-bash-script and cyberciti.biz/faq/bash-loop-over-file/
## Feature 02: File Type Count
Description: this feature returns the number of files with a user provided extension\
Execution: execute this feature by calling project_analyze.sh .. (Two characters after)\
Reference: some code was taken from stackoverflow.com/questions/8509226/using-find-command-in-bash-script and ss64/bash/wc.html
## Feature 03: Tag Log
Description: this feature creates a file which contains all comments in python files that contain a user specified tag\
Execution: execute this feature by calling project_analyze.sh ... (Three characters after)\
Reference: some code was taken from tldp.org/LDP/abs/html/special-chars.html
## Feature 04: Script Input
Description: this feature Allows the user to select which feature of the script they wish to use\
Execution: execute this feature by calling one of the other 3 features\
Reference: N/A
## Custom Feature 01: File Cleanup
Description: this feature finds all files of a user prompted directory and organises them into sub directories of the directory this script is located in based around their extension\
Execution: execute this feature by calling project_analyze.sh .... (Four characters after)\
Reference: some code was taken from https://stackoverflow.com/questions/8512462/looping-through-all-files-in-a-directory
## Custom  Feature 02: Broadly Alter Permissions
Description: this feature takes a user prompt which can either be an extension or file prefix and asks the user if they want all the files in that category to be executable or not and adjusts those files\
Execution: execute this feature by calling project_analyze.sh .....(Five characters after)\
Reference: some code was taken from https://stackoverflow.com/questions/6022384/bash-tool-to-get-nth-line-from-a-file/6022431 and 
## Feature 05: Switch to Executable
Description: this feature prompts the user to either type change or restore. If the user selects change, files become executable only by those who have write permissions to them and stores the original permissions in a file.
If the user selects Restore, the files are returned to their original permissions or if the user has not changed permissions, says so.\
Execution: execute this feature by calling project_analyze.sh ......(Six characters after)\
Reference: some code was taken from https://stackoverflow.com/questions/428109/extract-substring-in-bash and 
https://askubuntu.com/questions/144921/how-to-get-chmod-octal-permissions-of-the-folder-in-the-terminal
## Feature 06: Backup and Delete/Restore
Description: this feature prompts the user to either type backup or restore. If the user types backup, an empty directory is created that stores all temporary files and deletes them from their original location and creates a file
that logs their original locations. If the user selects restore, the files are restored to their original directories and locations.\
Execution: execute this feature by calling project_analyze.sh.......(Seven characters after)\
Reference: some code was taken from NOT YET IMPLEMENTED
