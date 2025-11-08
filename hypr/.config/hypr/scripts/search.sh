#!/bin/bash

# Description: Fuzzy find files using fzf with bat preview, open in vim

# Check if fzf, bat, and vim are installed
for cmd in fzf bat vim; do
    if ! command -v "$cmd" &> /dev/null; then
        echo "Error: '$cmd' is not installed. Please install it and try again."
        exit 1
    fi
done

# Run fzf with bat preview
FILE=$(fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' --height=80% --border)

# If a file was selected, open it in vim
if [[ -n "$FILE" ]]; then
    vim "$FILE"
else
    echo "No file selected."
fi

