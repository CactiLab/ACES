Work flow:

1. LLVM IR: 
    Input: project source code
    Output: Bitcode
2. LLVM pass: HexboxAnalysis.cpp
    Input: Bitcode
    Output: JSON file with program dependencies (projectname/.build/hexbox)
            JSON file with region sizes
3. graph_analysis/analyzer.py
    Input: Json file
        `networkx` lib is used to draw the program dependencies graph to create the compartment, then merge compartments according to different policies: filename, filenama-no-opt, peripherals.
    Output: Json file with merged compartments 
4. LLVM pass: HexboxApplication.cpp
    Input: JSON file (merged compartments with 3 different policies)
    Output: Compartments
5. graph_analysis/ld_helpers.py
    link script instrumentation
6. run record
7. Final link script instrumentation