#!/bin/bash
# if one of both of the following errors appear:
# /home/<NAME>/.local/share/applications/sandpile.desktop doesn't exist
# qtpaths not found
# then run this file.
# After running it, launch sp_installl.sh again.

mkdir ~/.local/share/applications
sudo pacman -Syy qt5-tools
rm -rf ~/sandpile
