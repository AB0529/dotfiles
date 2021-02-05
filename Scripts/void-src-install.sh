#!/bin/bash
VOID_REPOS=$HOME/Repos/void-packages
SYNC_ICO=$HOME/Pics/Icons/sync-ico.png
PKG=$1

# Send notification
notify-send -i $SYNC_ICO "Void Repos" "Installing $PKG..."

# Install bin
$VOID_REPOS/xbps-src pkg $PKG
# Install it really
cd $VOID_REPOS

sudo xbps-install --repository=hostdir/binpkgs $1

# Done
notify-send -i $SYNC_ICO "Vodi Repos" "Installed package $PKG"
