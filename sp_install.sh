#!/bin/bash

BRICK_HILL_PATH="$HOME/legacy-brick-hill"
CLIENT_BINARY="$BRICK_HILL_PATH/client/Player.exe"
WINE_PREFIX="$BRICK_HILL_PATH/.brick-hill-prefix"

mkdir $BRICK_HILL_PATH

cd $BRICK_HILL_PATH

mkdir client
cd client
# Download Player.exe
wget https://brkcdn.com/client/Player.exe

cd ..

# Register brickhill.legacy protocol
DESKTOP_FILE="[Desktop Entry]
Name=Brick Hill
NoDisplay=true
Exec=$BRICK_HILL_PATH/launcher.sh %u
Type=Application
Terminal=false
MimeType=x-scheme-handler/brickhill.legacy;"

echo "$DESKTOP_FILE" > ~/.local/share/applications/legacy-brick-hill.desktop

xdg-mime default legacy-brick-hill.desktop x-scheme-handler/brickhill.legacy

# Create launcher
touch launcher.sh
chmod +x ./launcher.sh

echo "#!/bin/bash
LAUNCH_OPTIONS=\${1##brickhill.legacy://client/}
CLIENT_BINARY=$CLIENT_BINARY
WINEPREFIX=$WINE_PREFIX wine \$CLIENT_BINARY \$LAUNCH_OPTIONS
" > launcher.sh

echo "Finished installation."
