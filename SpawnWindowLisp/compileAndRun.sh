#!/bin/bash

# Define paths
RAYLIB_INCLUDE="./raylib-5.0_macos/include"
RAYLIB_LIB="./raylib-5.0_macos/lib"

# 1. Compile C code, linking against Raylib
# We add -I to find headers and -L/-l to link the library
# Point directly to the .dylib file instead of using -lraylib and -L
# This forces the linker to use the path to the actual file
# Compile and bake the Raylib folder path into libfunction.dylib
gcc -shared -fPIC function.c -o libfunction.dylib \
    -I"./raylib-5.0_macos/include" \
    "./raylib-5.0_macos/lib/libraylib.500.dylib" \
    -Wl,-rpath,"$(pwd)/raylib-5.0_macos/lib"
    
# 2. Compile Lisp
ecl -eval '(compile-file "main.lisp")' -eval '(quit)'

# 3. Run
ecl -load main.fas