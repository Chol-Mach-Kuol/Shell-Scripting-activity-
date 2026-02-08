#!/bin/bash

# Step 1: Vault Setup
VAULT_DIR="$HOME/secure_vault"

# Create directory if it doesn't exist
mkdir -p "$VAULT_DIR"

# Create files and add welcome messages
echo "Welcome to the Keys File" > "$VAULT_DIR/keys.txt"
echo "Welcome to the Secrets File" > "$VAULT_DIR/secrets.txt"
echo "Welcome to the Logs File" > "$VAULT_DIR/logs.txt"

# Success message and list files
echo "Secure vault setup complete. Files created:"
ls -l "$VAULT_DIR"

