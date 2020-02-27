
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
	echo "Fourth incomplete"
elif [ "$#" -eq 5 ]; then
	echo "Fifth incomplete"
elif [ "$#" -eq 6 ]; then
	echo "Sixth incomplete"
elif [ "$#" -eq 7 ]; then
	echo "Do you wish to backup or restore" 
	read choice
	if [ " $choice" = "backup" ]; then
		echo "backup"
		if [ -d backup ]; then
			
	elif [ "$choice" = "restore" ] ; then
		echo "restore"
	fi
else
	echo "Further Features not yet implemented"
fi


