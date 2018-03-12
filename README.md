# LLVM Etsy School

## Usage

Examples are lettered in ascending order.

```sh
# Run example A
./run.sh a-hello
```

The output of the run script will contain the unoptimized LLVM IR followed by the output from running the program.

```sh
# Run example A, with optimizations
./run-o.sh a-hello
```

Runs the example, with optimizations enabled.

## Helpful Links

* [LLVM Language Reference](https://llvm.org/docs/LangRef.html)
* [getelementptr In Depth](https://llvm.org/docs/GetElementPtr.html)
* [LLVM Development Setup](https://llvm.org/docs/GettingStarted.html)
* [LLVM Passes](https://llvm.org/docs/Passes.html)

## Cheatsheet

```sh
# Compile C to LLVM IR and print it (omit -o to write to stdout)
clang -emit-llvm -S "in.c" -o "out.ll"
cat out.ll

# Compile C to an executable and run it
clang in.c -o out
./out
```

Install LLVM to get additional tools, like:

```sh
# Run LLVM IR directly
lli in.ll
```
