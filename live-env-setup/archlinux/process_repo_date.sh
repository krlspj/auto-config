#!/bin/bash

# Define the default value for repo_date
default_repo_date="2023/08/18"

# Check if a parameter is provided
if [ "$#" -eq 1 ]; then
    # Check if the parameter matches the expected format (yyyy/mm/dd)
    if [[ "$1" =~ ^[0-9]{4}/[0-9]{2}/[0-9]{2}$ ]]; then
        repo_date="$1"
    else
        #echo "Invalid date format. Please use the format 'yyyy/mm/dd'. Using default value: $default_repo_date"
        repo_date="$default_repo_date"
    fi
else
    #echo "No date parameter provided. Using default value: $default_repo_date"
    repo_date="$default_repo_date"
fi

#echo "repo_date is set to: $repo_date"
echo $repo_date
