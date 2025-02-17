#!/bin/bash

# Define the executable you want to check
EXECUTABLE="Hyprland"

# Get the process name from the executable path
PROCESS_NAME=$(basename "$EXECUTABLE")

# Check if the process is already running
if ! pgrep -x "$PROCESS_NAME" > /dev/null; then
    echo "Starting $PROCESS_NAME..."
    "$EXECUTABLE" &
else
    echo "$PROCESS_NAME is already running."
fi

