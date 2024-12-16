#!/bin/bash

# Declare an array to track commands that have displayed warnings
declare -a WARNED_COMMANDS=()

# warn_once function
warn_once() {
    local message="$1"
    shift
    local command_id="$1"
    shift

    if [[ ! " ${WARNED_COMMANDS[@]} " =~ " $command_id " ]]; then
        echo -e "\033[1;33mWARNING:\033[0m $message"
        read -p "Proceed? (y/n): " confirm
        if [[ "$confirm" =~ ^[Yy]$ ]]; then
            WARNED_COMMANDS+=("$command_id")
        else
            echo "Operation cancelled."
            return 1
        fi
    fi

    # Execute the command
    "$@"
}

# Create an alias for the pmc command with the warning function
alias pmc='warn_once "Be careful using the pmc command to handle key material in remote enviroments!" "pmc_command" pmc'
