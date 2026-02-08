#!/bin/bash

# Step 3: Vault Operations
VAULT_DIR="$HOME/secure_vault"
SECRETS="$VAULT_DIR/secrets.txt"
LOGS="$VAULT_DIR/logs.txt"
KEYS="$VAULT_DIR/keys.txt"

while true; do
    echo ""
    echo "Secure Vault Menu:"
    echo "1) Add Secret"
    echo "2) Update Secret"
    echo "3) Add Log Entry"
    echo "4) Access Keys"
    echo "5) Exit"
    echo -n "Choose an option [1-5]: "
    read option

    case $option in
        1)
            echo -n "Enter new secret: "
            read secret
            echo "$secret" >> "$SECRETS"
            echo "Secret added."
            ;;
        2)
            echo -n "Enter existing secret to replace: "
            read old
            echo -n "Enter new secret: "
            read new
            if grep -qF "$old" "$SECRETS"; then
                sed -i "s/$old/$new/" "$SECRETS"
                echo "Secret updated."
            else
                echo "No match found."
            fi
            ;;
        3)
            echo -n "Enter log entry: "
            read log
            echo "$(date '+%Y-%m-%d %H:%M:%S') - $log" >> "$LOGS"
            echo "Log entry added."
            ;;
        4)
            echo "ACCESS DENIED 🚫"
            ;;
        5)
            echo "Exiting vault operations."
            break
            ;;
        *)
            echo "Invalid option."
            ;;
    esac
done

