#!/bin/bash

# Get MySQL status line
systemctl status mysqld.service | grep "Status:" > ~/.config/hypr/scripts/status.conf

# Read the status content
status="$(cat ~/.config/hypr/scripts/status.conf)"

# Compare status and act accordingly
if [[ "$status" == '     Status: "Server is operational"' ]]; then
    mysql -p
else
    systemctl start mysqld.service
    mysql -p
fi

