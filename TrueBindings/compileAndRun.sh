#!/bin/bash
# 1. Compile the C bridge and BAKE the Raylib path into it
gcc -shared -fPIC function.c -o libfunction.dylib \
    -I"./include" \
    "./lib/macos/libraylib.500.dylib" \
    -Wl,-rpath,"$(pwd)/lib/macos"

# 2. Compile Lisp
ecl -eval '(compile-file "main.lisp")' -eval '(quit)'

# 3. Run
ecl -load "main.fas" -eval '(quit)'