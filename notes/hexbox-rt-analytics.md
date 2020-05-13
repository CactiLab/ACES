In the `Makefile`, the target library it generates are `syscalls`, `hexbox-enforce`, and `hexbox-record`. V6 for cortex-m0, v7 for cortex-m3, v7e for cortex-m4. 

- systemcalls: syscalls-v6-m.o, syscalls-v7-m.o, syscalls-v7e-m.o. (Source code: `syscalls.c`).
- hexbox-enforce: enforce-hexbox-rt-v6-m.o, enforce-hexbox-rt-v7-m.o, enforce-hexbox-rt-v7e-m.o. (Source code: `emulator.c`, `profiler.c`, `hexbox-rt.c`).
- hexbox-record: record-hexbox-rt-v6-m.o, record-hexbox-rt-v7-m.o, record-hexbox-rt-v7e-m.o. (Same source codes with hexbox-enforce).

Those files are used to make the run-time enhancement and build the white-list for sub-regions of MPU.

#### 2.2.1. Makefile:

- compile c code to bitcode

```Makefile
%-v6-m.bc: %.c
 $(CLANG) $(OPT_LEVEL)  -c -target arm-none-eabi -mcpu=cortex-m0   \
 $(CFLAGS) $< -o $@
 ...
```

- compile bitcode to library

```Makefile
# ======================Hexbox Enforce Lib =====================================
$(BUILD_DIR)/enforce-hexbox-rt-v6-m.o: enforce-hexbox-rt-v6-m.bc enforce-emulator-v6-m.bc enforce-profiler-v6-m.bc
 $(LLVM_PATH)/llvm-link $^ -o $(@)
 ...
```

- compile final object file

```Makefile
hexbox-enforce: $(BUILD_DIR) $(BUILD_DIR)/enforce-hexbox-rt-v6-m.o \
 $(BUILD_DIR)/enforce-hexbox-rt-v7-m.o \
 $(BUILD_DIR)/enforce-hexbox-rt-v7e-m.o
@echo Done Building Hexbox-Enforce
...
```

#### 2.2.2. syscalls

> System Workbench Minimal System calls file: \
<https://sourceforge.net/p/cppcheck/discussion/general/thread/cd15ce3ec9/20fa/attachment/syscalls.c>: \
The C runtime library include many functions, minimal system call is the redirection of the basic functions to the actual embedded platform. <https://github.com/JoeMerten/Stm32/blob/master/Lib/Stm/Stm32F2xx_StdPeriph_Lib_V1.1.0/Project/STM32F2xx_StdPeriph_Template/TrueSTUDIO/note.txt>

`syscalls.c` file is used to build the project, nothing special, not correspond any ACES new design. There is one example from this file:

```c
int __attribute__((weak)) _execve(char *name, char **argv, char **env)
{
  //errno = ENOMEM;
  return -1;
}
```

#### 2.2.3. profile

This file is to?

#### 2.2.4. emulator

This part associate with the section `Micro-emulator for Stack Protection` of the paper. Because of the align size of MPU configuration, some small areas can not be set up precisely. So they use the emulator to record the stack access (white-list) of the compartments. 