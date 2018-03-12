#!/usr/bin/env bash
set -eu

EXAMPLE="$1"

echo "Compile $EXAMPLE.c to $EXAMPLE.ll (LLVM IR)"
# -emit-llvm  emit LLVM IR instead of an executable
# -S only run preprocess and compile, with optimizations, emit IR instead of bitcode
clang -emit-llvm -S "$EXAMPLE.c" -O3 -o "$EXAMPLE.ll"

printf "\n####################\n"
echo "Optimized LLVM IR:"
cat "$EXAMPLE.ll"
echo "####################"

# -emit-llvm  emit LLVM IR instead of an executable
# -S only run preprocess and compile, with optimizations, emit IR instead of bitcode
clang "$EXAMPLE.c" -O3 -o "$EXAMPLE.e"
echo "Output:"
"./$EXAMPLE.e"
echo "####################"
