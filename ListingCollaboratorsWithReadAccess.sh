#!/usr/bin/env bash

OWNER=$1
REPO=$2

#USERNAME=$username
TOKEN=$token

API_URL="https://api.github.com"

urlformation() {
    local endpoint=$1
    local url="${API_URL}/${endpoint}"
    curl -s -H "Authorization: Bearer ${TOKEN}" "$url"
}

listusers() {
    local endpointapi="repos/${OWNER}/${REPO}/collaborators"
    
    collaborators=$(urlformation "$endpointapi" | jq -r '.[] | select(.permissions.push == true) | .login')
    
    if [[ -z "$collaborators" ]]
    then
        echo "No users"
    else
        echo "Users with access:"
        echo "$collaborators"
    fi
}

echo "Listing users with read access to ${OWNER}/${REPO}..."
listusers
