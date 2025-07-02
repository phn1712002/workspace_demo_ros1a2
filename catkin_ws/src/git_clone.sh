#!/bin/bash

# Check if list file exists
if [ ! -f "list_git_clone.txt" ]; then
    echo "Error: list_git_clone.txt not found in current directory"
    exit 1
fi

# Read each line and clone repositories
while IFS= read -r repo_url
do
    if [ -n "$repo_url" ]; then  # Skip empty lines
        echo "Cloning $repo_url..."
        git clone "$repo_url"
        if [ $? -ne 0 ]; then
            echo "Error cloning $repo_url"
        fi
    fi
done < "list_git_clone.txt"

echo "All repositories processed"
