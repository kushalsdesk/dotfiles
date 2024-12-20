#!/bin/bash

# Variables
SSH_DIR="$HOME/.ssh"
KEY_NAME="id_ed25519"
EMAIL="kushal99mondal@gmail.com"  # Update with your GitHub email

# Ensure SSH directory exists
mkdir -p "$SSH_DIR"

# Step 1: Generate SSH Key
echo "Generating SSH key..."
ssh-keygen -t ed25519 -C "$EMAIL" -f "$SSH_DIR/$KEY_NAME" -N ""

# Step 2: Start SSH Agent and Add Key
echo "Starting SSH agent..."
eval "$(ssh-agent -s)"
echo "Adding SSH key to agent..."
ssh-add "$SSH_DIR/$KEY_NAME"

# Step 3: Add SSH Key to GitHub
echo "Adding SSH key to GitHub..."
PUB_KEY=$(cat "$SSH_DIR/$KEY_NAME.pub")
gh auth login
#gh ssh-key add "$SSH_DIR/$KEY_NAME.pub" --title "$TITLE" --type authentication

# Step 4: Test SSH Connection to GitHub
echo "Testing SSH connection to GitHub..."
ssh -T git@github.com

# Completion message
echo "Setup complete! Your SSH key has been added and tested."

