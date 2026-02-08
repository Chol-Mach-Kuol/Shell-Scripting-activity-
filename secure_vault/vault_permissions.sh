#!/bin/bash

# Step 2: Vault Permissions
VAULT_DIR="$HOME/secure_vault"

# Function to update permissions
update_permission() {
    local file=$1
    local default_perm=$2
    echo -n "Do you want to update permissions for $file? (y/N): "
    read choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
        echo -n "Enter new permission (e.g., 600): "
        read perm
        if [[ -z "$perm" ]]; then
            chmod "$default_perm" "$VAULT_DIR/$file"
        else
            chmod "$perm" "$VAULT_DIR/$file"
        fi
    else
        chmod "$default_perm" "$VAULT_DIR/$file"
    fi
}

# Check vault exists
if [[ ! -d "$VAULT_DIR" ]]; then
    echo "Error: $VAULT_DIR does not exist. Run vault_setup.sh first."
    exit 1
fi

# Files and default permissions
declare -A files
files=( ["keys.txt"]=600 ["secrets.txt"]=640 ["logs.txt"]=644 )

for file in "${!files[@]}"; do
    echo "Current permissions for $file:"
    ls -l "$VAULT_DIR/$file"
    update_permission "$file" "${files[$file]}"
done

# Final permissions display
echo "Updated file permissions:"
ls -l "$VAULT_DIR"

