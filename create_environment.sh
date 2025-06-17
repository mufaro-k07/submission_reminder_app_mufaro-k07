#!/bin/bash

#This is the script to set up the directory structure and environment for the submission_reminder_app

#1. Prompt the user for their name 
read -p "Please enter your name: " stuName

#Defining a variable for the main directory
main_dir="submission_reminder_$stuName"

#Check if a directory with that name already exists
if [ -d "$main_dir" ]; then
	#If it exists, then it should print an error and exit
	echo "Error : Directory '$main_dir' already exists, please remove it first"
	exit 1
fi

#If it doesn't then it creates then the respective directories inside
echo "Creating directory structure... "
mkdir -p "$main_dir"/{app,modules,assets,config}
echo "Directory structure successfully created"

# Creating and Populating the Submissions.txt file
cat <<EOF > "$main_dir/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Mufaro, Git, submitted
Victoria, Shell Loops, not submitted
Peter, Shell Basics, not submitted
Edward, Shell Navigation, submitted
Kimi, Shell Loops, submitted
Lewis, Git, not submitted
Charles, Shell Basics, not submitted
Oscar, Shell Signals, submitted
Yuki, Shell Loops, submitted
George, Shell Signals, not submitted
EOF

echo "Submissions.txt has been populated"
cat "$main_dir/assets/submissions.txt"



