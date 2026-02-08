# CyberSec Ops: The Secure Vault Challenge

A Linux-based secure vault system for storing secrets, controlling file access, and monitoring security risks.

## Project Structure

- `vault_setup.sh` - Initializes the secure vault directory and files
- `vault_permissions.sh` - Manages file permissions with user interaction
- `vault_ops.sh` - Menu-driven interface for vault operations
- `vault_monitor.sh` - Generates security reports for vault files

## Usage

### Step 1: Setup the Vault
```bash
bash vault_setup.sh
```

### Step 2: Configure Permissions
```bash
bash vault_permissions.sh
```

### Step 3: Perform Vault Operations
```bash
bash vault_ops.sh
```

### Step 4: Monitor Security
```bash
bash vault_monitor.sh
```

## Features

- Secure file storage with customizable permissions
- Secret management (add/update)
- Timestamped logging
- Access control for sensitive files
- Automated security risk detection
- Comprehensive security reporting

## Requirements

- Linux/Unix environment
- Bash shell
- Basic file system permissions knowledge

## Security Notes

- Default permissions:
  - `keys.txt`: 600 (owner read/write only)
  - `secrets.txt`: 640 (owner read/write, group read)
  - `logs.txt`: 644 (owner read/write, group/others read)
- Files with permissions more open than 644 trigger security warnings
- Keys file access is always denied through the operations menu
