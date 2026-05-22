#!/bin/bash
# Clean compilation script for ECL FFI bindings
cd native
export DYLD_LIBRARY_PATH=$PWD/raylib-5.0_macos/lib:$DYLD_LIBRARY_PATH
# Pass CFLAGS to the ECL compiler to tell it where to find raylib.h
export CFLAGS="-I$PWD/raylib-5.0_macos/include"
ecl -eval '(compile-file "window.lisp" :load t)'
