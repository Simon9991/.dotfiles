#!/bin/bash

# Fetch from remote and prune deleted branches
git fetch -p

# List branches that have been merged into master, excluding certain branches
branches_to_delete=$(git branch --merged main | grep -E -v "(^\*|master|dev|main)")

# Check if there are branches to delete
if [ -z "$branches_to_delete" ]; then
	echo "No branches to delete."
	exit 0
fi

echo "The following branches will be deleted:"
echo "$branches_to_delete"

# Ask for user confirmation
read -p "Do you want to proceed with deletion? (Y/n) " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
	# Delete the branches
	echo "$branches_to_delete" | xargs git branch -D
	echo "Branches deleted."
else
	echo "Branch deletion cancelled."
fi
