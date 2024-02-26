#!/bin/bash

# Function to list backup files
list_backups() {
    path="${2:-$BACKUP_DIR_PATH}"

    find "${path}" -type f \( -name "$1" \) -exec ls -lht --color=never {} + |
        awk '{ "stat -c %y " $9 | getline file_date; file=substr($9, 11); sub(/\.[0-9]+/, "", file_date); \
        printf "\033[1;31m  File:\033[0m %-55s \033[1;35mDate:\033[0m %-25s \033[1;32m\tSize:\033[0m %-10s \033[1;34mOwner:\033[0m %s\n", file, file_date, $5, $3}'
}

list_databases() {
    username=${1}
    password=${2}

    if [[ -z $1 ]] && [[ -z $2 ]]; then
        username=$MYSQL_USER
        password=$MYSQL_PASSWORD
    elif [[ -z $1 ]] || [[ -z $2 ]]; then
        message_error "Username or password is not specified yet it is a required parameter."
        exit 1
    fi

    # Get the list of databases
    databases=($(mariadb -u$username -p$password -e "SHOW DATABASES;" | grep -v 'Database' | grep -v 'information_schema'))

    max_length=$((${#databases[0]}))
    for database in "${databases[@]}"; do
        if [ ${#database} -gt $max_length ]; then
            max_length=$((${#database}))
        fi
    done

    for database in "${databases[@]}"; do
        num_tables=$(mariadb -u$username -p$password -e "USE $database; SHOW TABLES;" | wc -l)
        printf "  \e[1;31mName:\e[0m \e[37m%-15s\e[0m\e[1;32mNumber of tables:\e[0m \e[37m%s\e[0m\n" "$database" "$num_tables"
        # Add a new line at the end for better formatting
        # Add more information about the database here, such as size, last backup date, etc.
    done
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
