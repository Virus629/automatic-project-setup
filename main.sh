#!/usr/bin/env bash

# Safer bash script
set -Eeuo pipefail

# Script version
readonly VERSION="v0.0.1 (June 26th 2021)"

# Github username
readonly USERNAME="USERNAME_HERE"
# Github OAuth Token: https://github.com/settings/tokens/new
readonly OAUTH_TOKEN="TOKEN_HERE"
# Default project path (where projects are stored on local)
readonly DEFAULT_PROJECT_PATH="~/Desktop/Projects/"
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
	echo "Name: $1"
	curl -u $USERNAME:$OAUTH_TOKEN https://api.github.com/user/repos -d "{\"name\":\"$1\"}"
fi
