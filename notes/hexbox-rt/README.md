# Hexbox runtime libarary analysis

In order to privide the runtime support for MPU context switch, stack protection, ACES developes the hexbox runtime libraries.

# Makefile

`Makefile` generates the bitcode of the target libraries: `syscalls`, `hexbox-enforce`, and `hexbox-record`. `V6` for `cortex-m0`, `v7` for `cortex-m3`, `v7e` for `cortex-m4`. Those versions for cortex-m are defined in the `FLAG`. All those bitcode will be linked together after compiling the test applications to generate the final binary code.

- systemcalls 
  - libraries: `syscalls-v6-m.o`, `syscalls-v7-m.o`, `syscalls-v7e-m.o`. 
  - source code: `syscalls.c`.
- hexbox-enforce
  - libraries: `enforce-hexbox-rt-v6-m.o`, `enforce-hexbox-rt-v7-m.o`, `enforce-hexbox-rt-v7e-m.o`. 
  - source code: `emulator.c`, `profiler.c`, `hexbox-rt.c`.
- hexbox-record
  - libraries: `record-hexbox-rt-v6-m.o`, `record-hexbox-rt-v7-m.o`, `record-hexbox-rt-v7e-m.o`. 
  - source code: `emulator.c`, `profiler.c`, `hexbox-rt.c` (Same source codes with hexbox-enforce).

Those files are used to handle MPU context switch, make the run-time enhancement, and build the white-list for sub-regions of MPU.

## Source code analysis

- Pre-defines
```Makefile
BUILD_DIR = ../../llvm/hexbox-rt-lib
LLVM_PATH = ../../llvm/bins/bin
INCLUDE_PATH = ../../gcc/bins/arm-none-eabi/include/
CLANG = $(LLVM_PATH)/clang
OPT_LEVEL = -O2

CFLAGS = -flto -fno-exceptions -I$(INCLUDE_PATH) -fshort-enums
CFLAGS += -fno-builtin -ffreestanding -fmessage-length=0 -ffunction-sections -g
CFLAGS += -gdwarf-2 -fdata-sections
```

Then set the steps to build the libraries for `cortex-m4` as an example:

- compile c code to bitcode


```Makefile
# compile c code to bitcode
%-v7e-m.bc: %.c
	$(CLANG) $(OPT_LEVEL)  -c -target arm-none-eabi -mcpu=cortex-m4   \
	$(CFLAGS) $< -o $@

record-%-v7e-m.bc: %.c
$(CLANG) $(OPT_LEVEL)  -c -target arm-none-eabi -mcpu=cortex-m4   \
$(CFLAGS) $< -o $@

enforce-%-v7e-m.bc: %.c
	$(CLANG) -DENFORCE $(OPT_LEVEL)  -c -target arm-none-eabi -mcpu=cortex-m4   \
	$(CFLAGS) $< -o $@

# ----------- link all bitcode (same version) together ----

# Hexbox Record Lib 
$(BUILD_DIR)/record-hexbox-rt-v7e-m.o: record-hexbox-rt-v7e-m.bc record-emulator-v7e-m.bc record-profiler-v7e-m.bc
	$(LLVM_PATH)/llvm-link $^ -o $(@)

# Hexbox Enforce Lib 
$(BUILD_DIR)/enforce-hexbox-rt-v7e-m.o: enforce-hexbox-rt-v7e-m.bc enforce-emulator-v7e-m.bc enforce-profiler-v7e-m.bc
	$(LLVM_PATH)/llvm-link $^ -o $(@)

# Syscalls 
$(BUILD_DIR)/syscalls-v7e-m.o: syscalls-v7e-m.bc
	$(LLVM_PATH)/llvm-link $^ -o $(@)

# ---------------- compile final libraries --------------

hexbox-enforce: $(BUILD_DIR) $(BUILD_DIR)/enforce-hexbox-rt-v6-m.o \
				$(BUILD_DIR)/enforce-hexbox-rt-v7-m.o \
				$(BUILD_DIR)/enforce-hexbox-rt-v7e-m.o
	@echo Done Building Hexbox-Enforce

hexbox-record: $(BUILD_DIR) $(BUILD_DIR)/record-hexbox-rt-v6-m.o \
				$(BUILD_DIR)/record-hexbox-rt-v7-m.o \
				$(BUILD_DIR)/record-hexbox-rt-v7e-m.o
	@echo Done Building Hexbox-Record

syscalls: $(BUILD_DIR) $(BUILD_DIR)/syscalls-v6-m.o \
					$(BUILD_DIR)/syscalls-v7-m.o \
					$(BUILD_DIR)/syscalls-v7e-m.o
	@echo Done Building Syscalls
```

All those libraries stored at llvm/hexbox-rt-lib/ directory

# syscalls

#### System Workbench Minimal System calls file
For more information about which c-functions need which of these lowlevel functions please consult the Newlib libc-manual: <https://sourceware.org/newlib> 

Newlib is a C runtime library intended for use on embedded systems. It is a conglomeration of several library parts.


One complete `syscall.c` example comparing with ACES: <https://sourceforge.net/p/cppcheck/discussion/general/thread/cd15ce3ec9/20fa/attachment/syscalls.c>. ACES modified some lines because it only uses syscall.c file which is only one file of Newlib project.


Porting and Using Newlib in Embedded Systems: <https://www.cs.ccu.edu.tw/~pahsiung/courses/esd/resources/newlib.pdf>

#### syscall.c analysis
 <https://github.com/CactiLab/ACES/blob/master/notes/hexbox-rt/syscalls.c>

# profile

This file is to?

# emulator

This part associate with the section `Micro-emulator for Stack Protection` of the paper. Because of the align size of MPU configuration, some small areas can not be set up precisely. So they use the emulator to record the stack access (white-list) of the compartments. 