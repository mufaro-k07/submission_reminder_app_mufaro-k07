#Submission Reminder Application

This application helps track and send reminders for student submissions. It automatically checks submission status and sends reminders to students with pending submissions.

# Setting Up
1. clone the repository using `https://github.com/mufaro-k07/submission_reminder_app_mufaro-k07.git`
2. make the setup scripts executable
chmod +x `create_environment.sh`
chmod +x `copilot_shell_script.sh`

## How it works

This app checks a list of students and their submission statuses for a specific assignment and reminds those who haven't submitted.

##  Scripts
-You start by running `create_environment.sh` by bashing it like this
`./create_environment.sh`
### 1. `create_environment.sh`
Sets up the project structure, essentially the environment, all the necessary directories
-It will prompt you to enter your name
-Then it creates all the files and directories with your name
-Navigate into the created directory using `cd submission_reminder_{yourname}`
Start the application using `startup.sh`

### 2. `copilot_shell_script.sh`
This script lets you update the assignment name to one which you would like to look for
- Remember to go into the original directory of the project with the two scripts. You may use cd ..
- Then start the `copilot_shell_script.sh`
- It will prompt you to enter your name
-It will prompt you to enter the assignment you wish to check
-Then it will run startup.sh and display the output with the updated assignment you gave

The output of your directory should look like this 
You may use the command 'tree' to have this view:
`submission_reminder_<yourName>/`
├── app/
│   └── reminder.sh
├── modules/
│   └── functions.sh
├── config/
│   └── config.env
├── assets/
│   └── submissions.txt
└── startup.sh

