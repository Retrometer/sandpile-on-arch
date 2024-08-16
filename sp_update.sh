#!/bin/bash
# This script updates the client by removing and downloading a newer version of the exe

# Variables
SANDPILE_PATH="$HOME/sandpile"
CLIENT_BINARY="$SANDPILE_PATH/client/Player.exe"
WINE_PREFIX="$SANDPILE_PATH/.sandpile-prefix"

# Removing the file
rm -rf $CLIENT_BINARY

# Re-downloading the file
cd $SANDPILE_PATH/client
wget https://sandpile.xyz/static/Player.exe


echo Finished.
