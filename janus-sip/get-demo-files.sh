test -d build && rm -rf build
mkdir build && \
cd ./build && \
  git clone --branch v1.2.3 https://github.com/meetecho/janus-gateway.git
cd ..



# Source and destination base paths
SRC="./build/janus-gateway/html/demos"
DEST="./nginx/html/demos"

# Ensure the destination directory exists
mkdir -p "$DEST"
mkdir -p "$DEST/../css"
mkdir -p "$DEST/../"

# Copy local JS files
cp "$SRC/settings.js" "$DEST/"
cp "$SRC/janus.js" "$DEST/"
cp "$SRC/sip.js" "$DEST/"

# Copy local HTML files
cp "$SRC/index.html" "$DEST/"
cp "$SRC/sip.html" "$DEST/"
cp "$SRC/navbar.html" "$DEST/"
cp "$SRC/../footer.html" "$DEST/../"

# Copy local CSS
cp "$SRC/../css/demo.css" "$DEST/../css/"

# Copy image
cp "$SRC/../forkme_left_darkblue_121621.png" "$DEST/../"

echo "Local assets copied successfully to $DEST"


test -d build && rm -rf build

