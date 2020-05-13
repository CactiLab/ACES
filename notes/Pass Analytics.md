
# Quick start

New paths: 
- HexboxAnalysis: programanalysis
- HexboxApplication: program instrumentation
- ExperimentAnalysis.cpp

# Writing an LLVM Pass [1]

## Setting up the build environment 

path: lib/Transforms/CMakeLists.txt

```c++
add_llvm_library(LLVMTransformUtils
 ...
 HexboxAnalysis.cpp
 HexboxApplication.cpp
 ExperimentAnalysis.cpp
 ...
 )
```

## Basic code required
> Set HexboxAnalysis.cpp as an example, <https://github.com/CactiLab/ACES/blob/master/notes/llvm-pass/HexboxAnalysis.cpp>

### Includings

```c++
#include "llvm/ADT/Statistic.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/CallSite.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Pass.h"  //We are writing a pass, and this pass is operating on Functions (https://llvm.org/doxygen/classllvm_1_1Function.html)
#include "llvm/Support/raw_ostream.h"  //default
#include "llvm/Support/Debug.h"
#include "llvm/Transforms/Instrumentation.h"
#include "llvm/ADT/SmallSet.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "json/json.h"  //From https://github.com/open-source-parsers/jsoncpp
#include <fstream>

#include "llvm/IR/InstIterator.h"
```

### Namespace announcement:
```c++
using namespace llvm;
```
Required because the functions from the include files live in the llvm namesapce

<!-- ```c++
static cl::opt<std::string> HexboxAnalysisResults("hexbox-analysis-results",
                                  cl::desc("JSON File to write analysis results to"),
                                  cl::init("-"),cl::value_desc("filename"));
``` -->

### Anomymous namespace:

```c++
namespace {
```
Starting out an anomymous namespace (like statis to c). It makes the things declared inside of the anonymous namespace visible only to the current file. 

### Declare the pass:

```c++
  struct HexboxAnalysis : public FunctionPass {
```

A `HexboxAnalysis` class is a subclass of `FunctionPass`. FunctionPass operates on a function at a time.

### Pass identifier and register

```c++
    static char ID;
    HexboxAnalysis() : FunctionPass(ID) {
        initializeHexboxAnalysisPass(*PassRegistry::getPassRegistry());
    }
```
Pass identifier used by LLVM to identify pass. This allows LLVM to avoid using expensive C++ runtime information. (???)

`PassRegistry::getPassRegistry()`: 

### Method declaration

```c++
    Json::Value OutputJsonRoot;
    Json::Value & AddFunctionToJSON(Function & F){
        ...
    }
```
AddFunctionToJSON method, overrides an abstract virtual method inherited from FunctionPass.

### Initilize pass ID

line 615
```c++
char HexboxAnalysis::ID = 0;
```
LLVM uses ID's address to identify a pass, so initialization value is not important.

## <s> Register pass </s>

Based on llvm document, the register looks like:
```c++
static llvm::RegisterStandardPasses Y(
    llvm::PassManagerBuilder::EP_EarlyAsPossible,
    [](const llvm::PassManagerBuilder &Builder,
       llvm::legacy::PassManagerBase &PM) { PM.add(new Hello()); });
```

The Hello is the name of the new pass. But ACES uses another way to register its new pass, that is to say, the new passes of ACES are actually modified to be the default passes of LLVM, so we don't need to use RegisterPass function to register them. 

## <s> Runing a pass with opt </s>

If we use RegisterPass to register a pass (name is Hello), then we are able to use the opt tool to acces it , once loaded.

```shell
$ opt -load lib/LLVMHello.so -hello < hello.bc > /dev/null
```

# Other two passes

HexboxApplication.cpp is the ModulePass, we pass uses the entire program as a unit, referring to function bodies in no predictable order, or adding and removing functions. No optimization can be done for their execution.

ExperimentAnalysis.cpp is the FunctionPass.

# Getting started with the LLVM System [2]

Although the those three passes are new passes for LLVM, this project compiles it as the default LLVM pass. 

## Directory Layout

```
llvm
  |-> examples: Simple examples using the LLVM IR and JIT
  |-> include
    |-> llvm/include/llvm: all LLVM-specific header files, and Analysis, CodeGen, Target, Transforms, etc...
    |-> llvm/include/llvm/Support: Generaric support libraries provided with LLVM but not necessarily specific to LLVM
    |-> llvm/include/llvm/Config: Header files configured by cmake.
  |-> lib: Most source files are here.
    |-> IR: Core LLVM source files that implement core classes like Instruction and BasicBlock.
    |-> AsmParser: Source code for the LLVM assembly language parser library.
    |-> Bitcode: Code for reading and writing bitcode.
    |-> Analysis: A variety of program analyses, such as Call Graphs, Induction Variables, Natural Loop Identification, etc.
    |-> Transforms: IR-to-IR program transformations, such as Aggressive Dead Code Elimination, Sparse Conditional Constant Propagation, Inlining, Loop Invariant Code Motion, Dead Global Elimination, and many others.
    |-> Target: Files describing target architectures for code generation. For example, llvm/lib/Target/X86 holds the X86 machine description.
    |-> CodeGen: The major parts of the code generator: Instruction Selector, Instruction Scheduling, and Register Allocation.
    |-> MC
    |-> ExecutionEngine: Libraries for directly executing bitcode at runtime in interpreted and JIT-compiled scenarios.
    |-> Support: Source code that corresponding to the header files in llvm/include/ADT/ and llvm/include/Support/.
  |-> Projects: shipped with LLVM
  |-> test: Feature and regression tests and other sanity checks on LLVM infrastructure.
  |-> tools: Executables built out of the libraries above, which form the main part of the user interface. 
    |-> llvm-ar: The archiver produces an archive containing the given LLVM bitcode files, optionally with an index for faster lookup.
    |-> llvm-as: The assembler transforms the human readable LLVM assembly to LLVM bitcode.
    |-> llvm-dis: The disassembler transforms the LLVM bitcode to human readable LLVM assembly.
    |-> llvm-link: llvm-link, not surprisingly, links multiple LLVM modules into a single program.
    |-> lli: lli will function as a Just-In-Time compiler and will execute the code much faster than the interpreter.
    |-> llc: LLVM backend compiler, which translates LLVM bitcode to a native code assembly file.
    |-> opt: opt reads LLVM bitcode, applies a series of LLVM to LLVM transformations (which are specified on the command line), and outputs the resultant bitcode. opt can also run a specific analysis on an input LLVM bitcode file and print the results. Primarily useful for debugging analyses, or familiarizing yourself with what an analysis does.
  |-> utils: Utilities for working with LLVM source code; some are part of the build process because they are code generators for parts of the infrastructure.
    |-> Codegen-diff
    |-> emacs
    |-> getstrcs.sh
    |-> llvmgrep
    |-> TableGen: Contains the tool used to generate register descriptions, instruction set descriptions, and even assemblers from common TableGen description files.
    |-> vim
```

## An Example Using the LLVM Tool Chain

### Example with clang

1. Create a simple C file: "hello.c"
```c
#include <stdio.h>

int main() {
  printf("hello world\n");
  return 0;
}
```

2. Compile the C file into a native executable:

```shell
% clang hello.c -o hello
```
3. Compile the C file into an LLVM bitcode file:

```shell
% clang -O3 -emit-llvm hello.c -c -o hello.bc
```
4. Run the program in both forms. To run the program, use:
```shell
% ./hello
```
and
```shell
% lli hello.bc
```
The second examples shows how to invoke the LLVM JIT, lli.

5. Use the llvm-dis utility to take a look at the LLVM assembly code:
```shell
% llvm-dis < hello.bc | less
```

6. Compile the program to native assembly using the LLC code generator:
```shell
% llc hello.bc -o hello.s
```
7. Assemble the native assembly language file into a program:
```shell
% /opt/SUNWspro/bin/cc -xarch=v9 hello.s -o hello.native   # On Solaris

% gcc hello.s -o hello.native                              # On others
```
8. Execute the native code program:
```shell
% ./hello.native
```

Note that using clang to compile directly to native code (i.e. when the -emit-llvm option is not present) does steps 6/7/8 for you.

### Example with ACES test-project



# Refernces

> [1] http://llvm.org/docs/WritingAnLLVMPass.html#introduction-what-is-a-pass  
> [2] http://llvm.org/docs/GettingStarted.html
