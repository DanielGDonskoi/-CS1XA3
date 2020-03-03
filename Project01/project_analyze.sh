
#!/bin/bash
if [ "$#" -eq 1 ]; then
	if [ -f "fixme.log" ]; then
		rm fixme.log
		echo "fixme.log already exists, overwriting"
		touch fixme.log
	else
		touch fixme.log
		echo "Created fixme.log and logged files noted as needing fixes"
	fi
	for file in ./** ; do
		v=$(tail $file)
		vname=$file
		if [ "$v" = "#FIXME"  ]; then
			echo $vname >> fixme.log 
		fi
	done;
elif [ "$#" -eq 2 ]; then
	echo "Please enter a file extension beginning with .(example .txt)"
	read extension
	echo The Extension is $extension
	found=$(find -type f -name "*$extension" | wc -l )
	echo "There is $found files with this extension in this directory"
elif [ "$#" -eq 3 ]; then
	echo "Please enter a tag"
	read tag
	echo The tag is $tag
	if [ -f "Tag.log" ]; then
		rm Tag.log
		echo "Tag.log already exists, overwriting"
		touch Tag.log
	else
		touch Tag.log
		echo "Created Tag.log"
	fi
	pythonfiles=$(find -type f -name "*.py")
	for file in $pythonfiles; do
		octothorp=$(grep "#" $file )
		if [[ $octothorp =~ $tag ]]; then
			echo $octothorp >> Tag.log
		fi
	done
elif [ "$#" -eq 4 ]; then
	echo "Please input a directory"
	read givend
	direct=$(find -type d -name "$givend")
	found=$(find "$direct" -type f)
	for file in $found; do
		fileext=${file##*.}
		echo $fileext
		if [ -d "$fileext files" ]; then
			mv $file "$fileext files"
		else
			mkdir "$fileext files"
			mv $file  "$fileext files"
		fi
	done
elif [ "$#" -eq 5 ]; then
	touch modifieditems.log
	echo "Please specify if you want an extension or prefix"
	read choice1
	echo "Please enter the prefix or extension"
	read choice2
	if [ "$choice1" = "extension" ]; then
		echo "The user selected an extension"
		found=$(find . -type f -name "*$choice2")
	elif [ "$choice1" = "prefix" ]; then
		echo "The user selected a prefix"
		found=$(find . -name "$choice2*")
	fi
	for item in $found; do
		echo $item >> modifieditems.log
	done
	echo "Input yes if you want the files to be executable and no if not"
	read executable
	if [ "$executable" = "yes" ]; then
		for item in $found; do
			name=$( basename $item )
			chmod a+x $name
		done
	else
		for item in $found; do
			name=$( basename $item)
			chmod a-x $name
		done
	fi
elif [ "$#" -eq 6 ]; then
	found=$(find . -type f -name "*.sh") 
	touch permissions.log
	echo "Enter change to change permissions, Enter restore to restore them"
	read userinput
	if [ "$userinput" = "change" ]; then
		echo "You have selected change"
		for item in $found; do
			octal=$(stat -c %a "$item" )
			userread=${octal:0:1}
			echo $octal >> permissions.log
		done
	elif [ "$userinput" = "restore" ]; then
		echo "You have selected Restore"
		count=0
		for file in $found;do
			count=$(($count+1))
			name=$(basename $file)
			echo $(sed "${count}q;d" permissions.log)
			echo $name
			chmod $(sed "${count}q;d" permissions.log) $name 
		done
	fi
elif [ "$#" -eq 7 ]; then
	echo "Do you wish to backup or restore" 
	read choice
	if [ "$choice" = "backup" ]; then
		rm restore.log
		echo "You have selected backup"
		if [ -d backup ]; then
			echo "backup exists"
			rm -r backup
			mkdir backup
		else
			mkdir backup
		fi
		found=$(find . -type f -name "*.tmp")
		touch restore.log
		for item in $found ; do
			echo $item
			echo $item >> restore.log
			mv $item backup
		done	
	elif [ "$choice" = "restore" ] ; then
		echo "You have selected restore"
		backupfiles=$(find backup -type f)
		for file in "$backupfiles"  ; do 
			echo $file
			x=$(head restore.log)
			xdir=$(dirname $x)
			echo $xdir
			mv $file $xdir
		done
	fi
else
	echo "Further Features not yet implemented"
fi



