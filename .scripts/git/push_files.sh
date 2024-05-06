#!/bin/bash

# Function to prompt for commit message
prompt_for_commit_message() {
	echo "Enter commit message:"
	read -r commit_message
	echo "Enter commit details (optional):"
	read -r commit_details
}

# Function to confirm git status
confirm_git_status() {
	git status
	read -p "Do you want to continue with the commit? (Y/n) " -n 1 -r
	echo
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		echo "Git operation was aborted by the user"
		exit 1
	fi
}

# Parse arguments
commit_message=""
commit_details=""
files=()
while [[ $# -gt 0 ]]; do
	key="$1"

	case $key in
	-m)
		if [ -z "$commit_message" ]; then
			commit_message="$2"
		else
			commit_details="$2"
		fi
		shift # past argument
		shift # past value
		;;
	*)
		files+=("$1") # save it in an array for later
		shift         # past argument
		;;
	esac
done

# Add files to staging
if [ ${#files[@]} -eq 0 ]; then
	git add *
else
	for file in "${files[@]}"; do
		git add "$file"
	done
fi

# Confirm git status before committing
confirm_git_status

# Commit and push
if [ -z "$commit_message" ]; then
	prompt_for_commit_message
fi

if [ -z "$commit_details" ]; then
	git commit -m "$commit_message"
else
	git commit -m "$commit_message" -m "$commit_details"
fi

git push

echo "Changes have been pushed successfully."
