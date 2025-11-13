#!/bin/bash

# PwnappleOS Customization Script

echo "--- Installing essential packages for macOS look ---"

if command -v apt &> /dev/null
then
    sudo apt update
    # Install Latte Dock (essential) and tools to download themes (knewstuff-cli)
    sudo apt install -y latte-dock plasma-sdk knewstuff-cli git
else
    echo "Error: apt package manager not found. This script requires a Debian/Ubuntu base."
    exit 1
fi

echo "--- Installing WhiteSur Theme Components ---"

# This uses the Plasma Get New Stuff command-line tool to download the theme directly.
# Note: Theme names must match what's on the KDE store.

# Global Theme
knewstuff-cli --platform plasmoid --install 'WhiteSur Dark'

# Icons (Optional, but highly recommended)
knewstuff-cli --platform icons --install 'WhiteSur'

# Cursor Theme
knewstuff-cli --platform cursors --install 'WhiteSur-cursors'

echo "--- Applying Basic Settings ---"
# Set the downloaded theme as the default global theme
kwriteconfig6 --file kdeglobals --group General --key ColorScheme 'WhiteSur Dark'
kwriteconfig6 --file kdeglobals --group General --key Name 'WhiteSur Dark'

# Set window buttons to the left (like macOS)
# Note: The 'kwriteconfig6' command might be 'kwriteconfig5' depending on the Plasma version.
kwriteconfig6 --file kwinrc --group Windows --key ButtonsOnLeft "LIA" # LIA = Left, Icon, All
kwriteconfig6 --file kwinrc --group Windows --key ButtonsOnRight ""


echo "--- PwnappleOS Next Steps ---"
echo "1. **RESTART** your system to apply theme changes."
echo "2. Launch **Latte Dock** (it may already start)."
echo "3. Open KDE System Settings and ensure the 'WhiteSur Dark' Global Theme is active."
echo "4. Configure Latte Dock for the dock and the top panel."
