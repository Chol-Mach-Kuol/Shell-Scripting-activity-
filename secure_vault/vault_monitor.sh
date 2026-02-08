#!/bin/bash

# Step 4: Vault Monitoring
VAULT_DIR="$HOME/secure_vault"
REPORT="$VAULT_DIR/vault_report.txt"

echo "Vault Report - $(date)" > "$REPORT"
echo "---------------------------------" >> "$REPORT"

for file in "$VAULT_DIR"/*; do
    filename=$(basename "$file")
    size=$(stat -c%s "$file")
    mod_date=$(stat -c%y "$file")
    perm=$(stat -c%A "$file")
    echo "File: $filename" >> "$REPORT"
    echo "Size (bytes): $size" >> "$REPORT"
    echo "Last Modified: $mod_date" >> "$REPORT"
    echo "Permissions: $perm" >> "$REPORT"
    
    # Check for risky permissions
    numeric_perm=$(stat -c%a "$file")
    if (( numeric_perm > 644 )); then
        echo "⚠️ SECURITY RISK DETECTED" >> "$REPORT"
    fi
    echo "---------------------------------" >> "$REPORT"
done

echo "Vault monitoring complete. Report saved to $REPORT"

