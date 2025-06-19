#!/bin/bash

read -p "Enter a new assignment name: " newAssign

latestdir=$(find . -type d -name "submission_reminder_*" | tail -n 1)

configfile="${latestdir}/config/config.env"

