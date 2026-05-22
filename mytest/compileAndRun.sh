#!/bin/bash

# 1. Clean up previous build artifacts
rm -f libfunction.dylib main.fas

# 2. Compile C code to a shared library
echo "Compiling C library..."
gcc -shared -fPIC function.c -o libfunction.dylib

# 3. Compile Lisp code
echo "Compiling Lisp file..."
ecl -eval '(compile-file "main.lisp")' -eval '(quit)'

# 4. Run the resulting fasl file
echo "Running application..."
ecl -load main.fas