#!/usr/bin/env bash

# Specify the alias
ALIAS_TO_ADD='alias tf="terraform"'

# Check if .bash_profile exists
if [ -e "$HOME/.bash_profile" ]; then
    # Check if the alias already exists in .bash_profile
    if ! grep -q "$ALIAS_TO_ADD" "$HOME/.bash_profile"; then
        # If not, add the alias to .bash_profile
        echo -e "\n# Added by the script\n$ALIAS_TO_ADD" >> "$HOME/.bash_profile"
        echo "Alias 'tf' added to .bash_profile. Please restart your shell or run 'source ~/.bash_profile'."
    else
        echo "Alias 'tf' already exists in .bash_profile. No changes made."
    fi
else
    echo "Error: .bash_profile not found in your home directory."
fi
