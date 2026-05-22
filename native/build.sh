#!/bin/bash
# 1. Compile the C bridge and BAKE the Raylib path into it
gcc -shared -fPIC ./main/function.c -o bin/libfunction.dylib \
    -I"./include" \
    "./lib/macos/libraylib.500.dylib" \
    -Wl,-rpath,"$(pwd)/lib/macos"

echo the file was compiled

# Clear the build folder contents, but keep the folder itself
rm -f ./build/*

# 2. Compile Lisp
ecl -eval '(compile-file "./main/main.lisp" :output-file "./bin/main.fas")' -eval '(quit)'

# 3. Run
ecl -load "./bin/main.fas" -eval '(quit)'