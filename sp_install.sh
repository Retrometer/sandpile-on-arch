#!/bin/bash

SANDPILE_PATH="$HOME/sandpile"
CLIENT_BINARY="$SANDPILE_PATH/client/Player.exe"
WINE_PREFIX="$SANDPILE_PATH/.sandpile-prefix"

mkdir $SANDPILE_PATH

cd $SANDPILE_PATH

mkdir client
cd client
# Download Player.exe
wget https://sandpile.xyz/static/Player.exe

cd ..

# Register brickhill.legacy protocol
DESKTOP_FILE="[Desktop Entry]
Name=SandPile
NoDisplay=true
Exec=$SANDPILE_PATH/launcher.sh %u
Type=Application
Terminal=false
MimeType=x-scheme-handler/sandpile.legacy;"

echo "$DESKTOP_FILE" > ~/.local/share/applications/sandpile.desktop

xdg-mime default sandpile.desktop x-scheme-handler/sandpile.legacy

# Create launcher
touch launcher.sh
chmod +x ./launcher.sh

echo "#!/bin/bash
LAUNCH_OPTIONS=\${1##sandpile.legacy://client/}
CLIENT_BINARY=$CLIENT_BINARY
WINEPREFIX=$WINE_PREFIX wine \$CLIENT_BINARY \$LAUNCH_OPTIONS
" > launcher.sh

echo "Finished installation."
