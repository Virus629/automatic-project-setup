#!/usr/bin/env bash

# Safer bash script
set -Eeuo pipefail

# Script version
readonly VERSION="v0.0.2 (June 26th 2021)"

# Github username
readonly USERNAME="USERNAME_HERE"
# Github OAuth Token: https://github.com/settings/tokens/new
readonly OAUTH_TOKEN="TOKEN_HERE"
# Default project path (where projects are stored on local)
# You can always change this to hard coded path
readonly DEFAULT_PROJECT_PATH="/home/$(whoami)/Desktop/Projects"
# Default editor (ex. Vs Code)
# TODO:
# Check if this could use EDITOR from env
readonly DEFAULT_EDITOR="code"

# Amount of args must be 1
if [[ $# -lt 1 ]] || [[ $# -gt 1 ]]; then
	printf "[ERROR] Invalid amount of args\n"
	printf "Usage: $0 project_name\n"
	exit 1
else
	# Create Github repo
	curl -u $USERNAME:$OAUTH_TOKEN https://api.github.com/user/repos -d "{\"name\":\"$1\"}" > /dev/null 2>&1
	echo ">> Github repo created with name $1! Link: https://github.com/USERNAME_HERE/$1"

	# Create local files
	cd "$DEFAULT_PROJECT_PATH" && mkdir "$1"
	echo ">> Created new folder to $DEFAULT_PROJECT_PATH with name $1"

	# Open default editor here
	cd "$DEFAULT_PROJECT_PATH/$1"

	$DEFAULT_EDITOR .

	git init
fi
