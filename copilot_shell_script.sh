#!/bin/bash

#This script allows the user to change the assignment name in the config file
echo "Welcome back!! 😊"
#Prompt the user for their name to locate the correcty directory
read -p "Enter your name: " stuName
main_dir="submission_reminder_${stuName}"

#Define the path to the config file
config_file="submission_reminder_${stuName}/config/config.env"

#Checking if the config file exits
if [ ! -f "$config_file" ]; then
        echo "Error: Configuration file '$config_file' not found."
        echo "Please make sure you have run the create_environment.sh script with the correct name"
        exit 1
fi

#Displaying the assignment names
echo " "
echo " These are the assignments available"
echo "---------------------------------------"
echo "Shell Navigation"
echo "Git"
echo "Shell Basics"
echo "Shell Loops"
echo "Shell Signals"
echo " "

#Prompt the user for the assignment name to check
read -p "Enter the new assignment name to check for : " newAssign

sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$newAssign\"/" "$config_file"


echo " "
echo "The assignment name has been updated successfully! to $newAssign"

echo "Now running the application with the updated assignment"

#Navigating to the main directory then running the startup.sh script
(cd "$main_dir" && ./startup.sh)

