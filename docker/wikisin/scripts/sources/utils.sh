#!/bin/bash

# Function to list backup files
list_backups() {
    path="${2:-$BACKUP_DIR_PATH}"

    find "${path}" -type f \( -name "$1" \) -exec ls -lht --color=never {} + |
        awk '{ "stat -c %y " $9 | getline file_date; file=substr($9, 11); sub(/\.[0-9]+/, "", file_date); \
        printf "\033[1;31m  File:\033[0m %-55s \033[1;35mDate:\033[0m %-25s \033[1;32m\tSize:\033[0m %-10s \033[1;34mOwner:\033[0m %s\n", file, file_date, $5, $3}'
}

# Function to create a countdown
countdown() {
    # Description of the function
    declare desc="A simple countdown."

    # Input parameter: number of seconds for the countdown
    local seconds="${1}"

    # Calculate the end time of the countdown
    local d=$(($(date +%s) + $seconds))

    # Loop until the end time is reached
    while [ "$d" -ge $(date +%s) ]; do
        # Print the remaining time in HH:MM:SS format
        echo -ne "$(date -u --date @$(($d - $(date +%s))) +%H:%M:%S)\r"

        # Wait for a short duration
        sleep 0.1
    done
}
