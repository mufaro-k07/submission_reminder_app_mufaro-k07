#!/bin/bash

#This is the script to set up the directory structure and environment for the submission_reminder_app
echo "Hello and Welcome to Mufaro's reminder app."

#1. Prompt the user for their name
read -p "Please enter your name: " stuName

#If the user enters nothing, then it gives a default name 'student'
if [ -z "$stuName" ]; then
	stuName="student"
	echo "No name has been entered. Using the default name 'student'."
fi

#Defining a variable for the main submission directory
main_dir="submission_reminder_$stuName"

#Checking if a directory with that name already exists
if [ -d "$main_dir" ]; then
	#If it exists, then it should print an error message and exit
	echo "Error : Directory '$main_dir' already exists, please remove it first"
	exit 1
fi

#If it doesn't exist, then it creates the parent directory and the respective directories inside
echo "Creating directory structure..."
mkdir -p "$main_dir"/{app,modules,assets,config}
echo "Directory structure successfully created"

#Creating and Populating the Submissions.txt
cat > "$main_dir/assets/submissions.txt" << 'EOF'
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

echo " "
echo "Submissions.txt has been created and populated successfully"

#Creating and populating the config.env file
cat > "${main_dir}/config/config.env" << 'EOF'
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

echo " "
echo "Config.env has been created and populated successfully"

#Creating and populating the functions.sh script
cat > "${main_dir}/modules/functions.sh" << 'EOF'
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file="$1"
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF

echo " "
echo "Functions.sh has been created and populated successfully"
chmod +x "$main_dir/modules/functions.sh"
echo "Functions.sh is now executable"

#Creating and populating the reminder.sh script
cat > "${main_dir}/app/reminder.sh" << 'EOF'
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

echo " "
echo "Reminder.sh has been created and populated"
chmod +x "$main_dir/app/reminder.sh"
echo "Reminder.sh is now executable"

#Creating the startup.sh script
cat > "${main_dir}/startup.sh" << 'EOF'
#!/bin/bash

echo "Running reminder.sh"
./app/reminder.sh
EOF

chmod +x "$main_dir/startup.sh"
echo "startup.sh has now been created and is executable"

echo "Ensuring all .sh files are executable ...."
find "$main_dir" -type f -name "*.sh" -exec chmod +x {} \;

echo " "
echo "Environment setup is complete!, congratulations"
echo "You may cd into your submission_reminder_'yourname' folder then ./startup.sh to run the startup script"
