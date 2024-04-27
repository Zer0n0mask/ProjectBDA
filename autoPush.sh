#!/bin/bash

# Define the path to the lock file
LOCK_FILE="/tmp/auto_backup_togit.lock"

# Check if the lock file exists
if [ -e "$LOCK_FILE" ]; then
    echo "Another instance of the script is already running. Exiting."
    exit 1
fi

# Create the lock file
touch "$LOCK_FILE"

# Change directory to your project folder
cd /home/daniel/Documents/MySQL/ProjectBDA

# Display the SSH public key
cat ~/.ssh/id_rsa.pub

# Infinite loop for continuous execution
while true
do
    # Add all changes
    git add .

    # Commit changes
    git commit -m "Daniel-autoBackUp-$(date)"

    # Push changes to GitHub
    echo "------------Starting to push to Github------------"
    git push origin master
    echo "------------Finished pushing to Github------------"

    # Wait for 300 seconds (5 minutes)
    sleep 300
done

# Remove the lock file when the script exits
rm "$LOCK_FILE"

