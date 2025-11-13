#!/bin/bash

# PwnappleOS Customization Script

echo "--- Installing essential packages for macOS look ---"

# Check for apt and install Latte Dock (essential for a good dock experience)
if command -v apt &> /dev/null
then
    sudo apt update
    # Install Latte Dock and a custom theme engine if needed
    sudo apt install -y latte-dock plasma-sdk
else
    echo "Error: apt package manager not found. This script requires a Debian/Ubuntu base."
    exit 1
fi

echo "--- PwnappleOS Setup Guide ---"
echo "1. **RESTART** your system."
echo "2. Launch **Latte Dock** (search for it in the app launcher)."
echo "3. Go to **KDE System Settings** -> **Appearance** -> **Global Theme**."
echo "4. Download and apply a macOS-like theme (e.g., 'WhiteSur' or 'McMojave') from the 'Get New Global Themes...' button."
echo "5. Manually configure Latte Dock to use your preferred layout."
