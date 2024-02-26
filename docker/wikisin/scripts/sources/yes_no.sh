#!/bin/bash

# Function to prompt for confirmation (yes/no)
# This function displays a message to the user and prompts for a yes/no response.
# It reads the user's input and returns 0 for "yes" and 1 for anything else.
# Usage: if yes_no "Do you want to proceed?"; then
#            # Proceed with the operation
#        else
#            # Cancel the operation
#        fi
yes_no() {
    local response
    read -r -p "$1 (y/n)? " response
    case "$response" in
        [yY])
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}
