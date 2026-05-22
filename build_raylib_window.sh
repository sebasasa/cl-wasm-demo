#!/bin/bash

# Configuration
SOURCE="main.c"
OUTPUT="raylib_window"
INCLUDE_DIR="./raylib-5.0_macos/include"
LIB_DIR="./raylib-5.0_macos/lib"
RPATH="@executable_path/raylib-5.0_macos/lib"

# Compilation
echo "Compiling $SOURCE..."
gcc "$SOURCE" \
    -I"$INCLUDE_DIR" \
    -L"$LIB_DIR" \
    -lraylib \
    -Wl,-rpath,"$RPATH" \
    -o "$OUTPUT"

# Verification
if [ $? -eq 0 ]; then
    echo "Build successful! Executing..."
    ./"$OUTPUT"
else
    echo "Build failed."
fi
