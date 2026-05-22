#!/bin/bash

# Configuration
VERSION="5.0"
BASE_URL="https://github.com/raysan5/raylib/releases/download/${VERSION}"

# Create the folder structure
mkdir -p include lib/macos lib/linux lib/windows

echo "Downloading Raylib 5.0 binaries..."

# 1. Download packages
wget "${BASE_URL}/raylib-${VERSION}_macos.tar.gz"
wget "${BASE_URL}/raylib-${VERSION}_linux_amd64.tar.gz"
wget "${BASE_URL}/raylib-${VERSION}_win64_msvc16.zip"

# 2. Extract and Move
# Extract macOS
tar -xzf raylib-${VERSION}_macos.tar.gz
mv raylib-${VERSION}_macos/lib/libraylib.500.dylib lib/macos/
cp raylib-${VERSION}_macos/include/raylib.h include/

# Extract Linux
tar -xzf raylib-${VERSION}_linux_amd64.tar.gz
mv raylib-${VERSION}_linux_amd64/lib/libraylib.so.500 lib/linux/

# Extract Windows
unzip raylib-${VERSION}_win64_msvc16.zip
mv raylib-${VERSION}_win64_msvc16/lib/raylib.dll lib/windows/

# 3. Cleanup
rm -rf raylib-${VERSION}_macos raylib-${VERSION}_linux_amd64 raylib-${VERSION}_win64_msvc16
rm *.tar.gz *.zip

echo "Setup complete! Your project structure is now ready."