#!/bin/bash
#Auto fix git merge/cherry-pick conflicts in files
#Revision 1

#Startup check
if [[ -e /tmp/conflicts ]]; then
		rm -f /tmp/conflicts
fi;

#HEADER
echo "--- GIT Conflict Resolver v1.0"
echo "-- Created by broodplank"
echo "- broodplank.net"
echo
echo "-> Checking for .git folder"
echo -n "Result: "

#Check for .git folder for behavior
if [[ -d ${PWD}/.git ]]; then

	echo "found, using git diff"
	echo
	echo "-> Finding conflicts..."
	git diff --name-only --diff-filter=U > /tmp/conflicts

else 

	echo "not found, using native tools"
	echo
	echo "-> Finding conflicts..."
	grep -l -H -r '<<<<<<< HEAD' ${PWD}/* | awk '!a[$0]++' > /tmp/conflicts

fi;


#Check if conflicts exist
if [[ `cat /tmp/conflicts` != "" ]]; then
	echo 
	echo "-> Conflicts found in files:"
	while read F  ; do
	        echo '- '$F
	done </tmp/conflicts
else
	echo "STOP, No conflicts found!"
	exit
fi;

#Start executing standard conflict resolve strategy
echo 
echo "-> Fixing conflicts..."
echo
while read G  ; do
		echo "--> Working on file: $G"
		echo "Removing text between HEAD and middle"
        sed -i -s '/<<<<<<< HEAD/,/=======/d' $G
        echo "Removing conflict footer"
		sed -i -s '/>>>>>>>/d' $G
		echo
done </tmp/conflicts

#Assume conflicts are actually solved
echo "--> Conflicts have been automatically fixed!"
echo
echo "Please note:"
echo "Although most of the conflicts can be resolved this way, It does not count for all conflicts."
echo "If you experience errors on compiling please review the changes made"
echo

#Stage commit?
if [[ -d ${PWD}/.git ]]; then
	echo "Would you like to stage the commit? () [Y/n]"
	echo -n ": "
	read choice
	if [[ $choice != "n" ]]; then
		git add .
		git commit
	fi


fi;
echo
echo "All done!"
