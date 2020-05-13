# ACES Code Analyzis

> This is a document to analyze the ACES code or process. With the help of setup steps from <https://github.com/CactiLab/ACES/blob/master/Readme.md>, combining with ACES paper to understand how it works.

## 1.Environment setups

Before running the test project, we need to initialize the environment, including the `llvm` and `gcc tool-chain`.

```shell
cd compiler
ci_scripts/init_project.sh
ci_scripts/ci-build.sh
```
Because the target is ARM platform so we should cross-compile the clang/LLVM. It will need the tool `ninja`(<http://llvm.org/docs/HowToCrossCompileLLVM.html>): 

```shell
${SCRIPT_DIR}/cmake_config.sh ../llvm-release_40 ../bins
ninja install
```

After installing the `gcc tool-chain`, itself will download the newnest version of the gcc tool chain, then we need to mv it to gcc/bins. According to the author's explaination, old version of gcc has problems when debug the ACES, so they download the new one.

> ACES is implemented to perform four steps: 
> - programanalysis, 
> - compartment generation, 
> - program instrumenta-tion, 
> - and enforcement of protections at runtime.
> 
> Program analysis and program instrumentation are implemented as new `passes` in LLVM 4.0 and modifications to its `ARM backend`. Compartment generation is implemented in `Python` leveraging the NetworkX graph library. Runtime enforcement is provided in the form of a `C run-time library`.

After compiling and installing the LLVM, running the `makefile` in the `hexbox-rt` folder to generate the final tools ACES uses. Those tools utilize python script in the `graph_analysis` folder to analysis the PDG of the Application, then with the help of llvm, to 

## 2. Source Code Analysis

### 2.1. Files needed or added to LLVM

#### 2.1.1 add_list: 
 > Another link: https://github.com/CactiLab/ACES/blob/master/notes/add_list.md

- Headers

- IRs
  - `SelectionDAGBuilder.cpp`: creates DAG, it is used by analyzer.py to create 

- New passes
  - `HexboxAnalysis.cpp`
  - `HexboxApplication.cpp`
  - `ExperimentAnalysis.cpp`

- New backends
 - Modification of `ARMInstrThumb.td`, `ARMInstrInfo.td`, `ARMISelLowering.cpp`, and `ARMTargetMachine.cpp`

- ...

### 2.2. Pass analysis

<https://github.com/CactiLab/ACES/blob/master/notes/llvm-pass>

### 2.2. hexbox-rt analysis

<https://github.com/CactiLab/ACES/blob/master/notes/hexbox-rt>

## 3. Python Extension

### Python tools to do compartment generation

#### graph_analysis folder

### Python tools for running application

> Python tools with gdb to connect the running application

#### gdb_record.py

#### memory_reader.py

#### gdb_run.py

#### gdb_helpers.py

## 4. Makefile for test_projects

According to <https://github.com/baoshi/CubeMX2Makefile>, the `CubeMX2Makefile.py` in `repo_root/compiler/tools` is trying to create the Makefile for the specific STM project automatically.

This script utilize `.cproject` file to setup the environment the STM project needs, such as the link script, include files, etc. You can define the library or other tools you need in this script. 

>If you have the experience to load .cproject in TrueStdio IDE, it would be better to understand. Now we do not need those kind of IDE, ACES builds the project by gcc toolchain.

The generated Makefile includes (listed the important ones):

- gcc path, llvm path,
- hexbox library (hexbox-rt-lib): (Section 5.4) this library help to configure the MPU region 
- hexbox graph tool corresponds to `compiler/graph_analysis/analyzer.py`.

  - (Section 5.1) Uses the PDG and a device description to create an **initial region graph**. The region graph is a directed graph that captures the grouping of functions, global data, and peripherals into MPU regions. `line819: PDG=build_graph(args.json_graph)`
  - (Section 5.2) Peripherals are **merged** using the deivice decsription to build a tree of all the possible valid MPU regions the cover the device peripherals: `line820: get_device_desc(args.board)`, this function is in `device.py` file (build a tree of MPU regions that cover the peripherals).
    - `line162: build_mpu_region_tree(desc)`, desc is the sorted peripherals.
  - Then the final region graph is exported as a **JSON file** to `??/.build/hexbox`.

- hexbox final link tool corresponds to `final_linker_gen.py`.
  - (Section 5.4) This is to generate the second link script to protect the stack : previous link script is used to create the white-list. New link script is stored in `??/.build/hexbox`.
    - With the help of `setup_asm_and_ld.py` file, ACES adds comments to declaim the `line118 <HEXBOX_TEXT_SECTION>` and `line187: <HEXBOX_DATA_SECTIONS>` in the **original link script**. 
    - Then replace those two sections with the regions provided by the **JSON file** in the intermediate link file.
    - After recording all required address when running, generate the **final link script**. This because MPU region must be a power of two in size and the starting address must be a multiple of its size. But somes code and data regions are not meet this requirement, so use link script to create the white-list for those data and code regions. 

- hexbox result tool corresponds to `collect_results.py`.
  - (Section 6. Evaluation)

The Makefile will build the project based on the optimization policy we set.

- OBJECTS: `Makefile` calls `hexbox-rt-lib/syscalls-v7e-m.o` to build object files.
- generate intermediate and record partitioned binary: use `record-hexbox-rt-v7e-m.o` with policy and final-policy
- generate final partitioned binary use `enforce-hexbox-rt-v7e-m.o`

## 5. Build application 

> record data and code regions to generate the white-list

```bash
${REPO_ROOT}/compiler/tools/build_record.sh
```

This command should run in the project folder, inside this script:

```bash
#!/bin/bash
set -x

declare -a arr=("peripheral"
                "filename"
                "filename-no-opt"
                )


for i in "${arr[@]}"
do
  make all HEXBOX_METHOD=$i >$i_final.log 2>$i_final.log
done
```

Based on ACES paper, there are three optimazation policies (two are based on filename):

- peripheral: isolates peripherals from each other
- filename: merges all code regions with identical data and peripheral dependencies, reducing compartment transitions at runtime without changing data accessible to any compartment
- filename-no-optimization: a naive policy that demonstrates the versality of the policies ACES can apply, and pitfalls of such a policy

After this command, will generate:

- `.build` folder: including some object files, region memory mapping file.
- `.build/hexbox` folder: JSON files to describe the call graph, link scripts.
- `bin` folder: each policy has its own origin, hexbox intermedia, record `.o, .bc, .elf` file
- `.dot` files. (using analyzer.py and json files to generate) LLVM provides the command to generate dot files.

I want to check the the readable code after IR, so use `llvm-dis name.bc` to change `.bc` file to `.ll` file. Let's look at one of those bitcode files. It doesn't work.



## 5. Run the application

Before run this command, we need to connect the board with openocd tool.

```bash
APP_NAME=FatFs-uSD ~/Downloads/ACES-master/compiler/tools/build_final.sh record run
```

Load those `.elf` files generated by previoud steps to the board, using gdb and python script to connect the board. `gdb_record.py` corresponds with record option, `memory_reader.py` is used for different polices, `gdb_run.py` corresponds with run option.

> Actually, those python scripts are used to connect the gdb tool, read the memory of the board, then show the information of each region.

- recults.cvs: using collect_results.py and json files to generate

---

