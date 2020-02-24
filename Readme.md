# ACES: Automatic Compartments for Embedded Systems


This is was joint research effort between Purdue's [HexHive](http://hexhive.github.io/) and [DCSL](https://engineering.purdue.edu/dcsl/) research groups.  It is presented at [USENIX Security 2018](https://www.usenix.org/conference/usenixsecurity18/presentation/clements)

Both have many more open sourced software:
*  [HexHive Software](https://github.com/HexHive)
*  [DCSL Software](https://github.com/purdue-dcsl)



It has been tested on Ubuntu 16.04 other versions of linux may work.


## Dependencies
Install following on Ubuntu 16.04
```
build-essentials
make
texinfo
bison
flex
cmake
ninja-build
ncurses-dev
llvm-dev
clang
texlive-full
binutils-dev
python-networkx
python-matplotlib
python-pygraphviz
python-serial
pypip
```

```
pip install pydotplus
```

## Install openocd
Openocd is a on-chip debug tool. Follow those steps to install openocd: https://elinux.org/OpenOCD_Ubuntu_Package

##  Setup
To setup the project for the first time clone repo then run.

```
cd compiler
ci_scripts/init_project.sh
ci_scripts/ci-build.sh
```
This will setup the directory structure, build a arm-none-eabi-ld with plug-in support (builds all gcc)
and build the ACES compiler.  Which is an extension of LLVM.

The resulting directory structure will be as follows.

```
REPO_ROOT
  |-> compiler (Source for ACES compiler)
    |-> llvm  (Src for llvm, this is symlinked in to llvm-release_40 below)
    |-> ci_scripts (ci_scripts)
    |-> hexbox-rt (Runtime src for this project)
    |-> tools  (tools frequently used with this project)
  |-> llvm (created by init script)
    |->llvm-release_40
    |->clang-release_40
    |->hexbox-rt-lib (where the hexbox-rt lib gets built to)
    |->build  (Cmake Build dir for llvm)
    |->bins (LLVM build outputs)
  |-> gcc (created by init script)
    |->gcc-arm-none-eabi-6-...  (GCC Source dir)
    |->bins (location of arm-none-eabi-gcc tool chain and dirs)
  |->test_apps
```


## Building an Application

All test applications require the STM32469I-EVAL board from STM, with the exception of Pinlock which runs on
the STM32F4-Discovery board. Make sure arm-none-eabi-gdb-py is in your path, if not it was build with gcc and can be 
found in <REPO_ROOT>/gcc/bins/bin

You will need to perform the following steps to build the code

1. Build hexbox-rt

```
cd compiler/hexbox-rt
make all
```

2. Build record binaries
3. Run in record mode
4. Build final binaries

Steps 2 - 4 vary based on the board and commands are given below.

## Export gcc tool chain to the envornment

```bash
$ export PATH=$PATH:~/Download/ACES-master/gcc/bins/bin
```

### Pinlock

Set HEXBOX_ROOT in <REPO_ROOT>test_apps/pinlock/Decode/SW4STM32/STM32F4-DISCO/Makefile to REPO_ROOT
#### Build record binaries

```
$ cd test_apps/pinlock/Decode/SW4STM32/STM32F4-DISCO
$ {REPO_ROOT}/compiler/tools/build_record.sh
```

#### Run Binaries in record mode and build final binaries.

This requires that openocd be running and connected to the board.  You will also need to run the driver application which sends a series of valid and invalid pins to the board.

Connect 3.3V Serial port to Discovery Board RX PA2, TX PA3.  Where TX and RX are from the computers perspective.

Run Stimulus Script
```
$ python <REPO_ROOT>/test_apps/pinlock/pyterm/pinlock_stimulus.py
```

In separate terminal run record binary to get white-list, and build final binary
```
$ cd test_apps/pinlock/Decode/SW4STM32/STM32F4-DISCO
$ APPNAME=PinLock {REPO_ROOT}/compiler/tools/build_final.sh record run
```

### STM32469I-Eval board applications

#### Create Makefile and build application

cd to appropriate SW4STM32 directory under STM32Cube_FW_F4_V1.14.0/Projects/STM32469I_EVAL/Applications

```
$ cd STM32469I_EVAL
$ python {REPO_ROOT}/compiler/tools/built_tools/CubeMX2Makefile.py . <path to repo root> <Name (one of [FatFs-uSD, TCP-Echo, LCD-uSD, Animation])>
$ {REPO_ROOT}/compiler/tools/build_record.sh
```

For example:
```
$ cd ~/Downloads/ACES-master/test_apps/STM32Cube_FW_F4_V1.14.0/Projects/STM32469I_EVAL/Applications/FatFs/FatFs_uSD/SW4STM32/STM32469I_EVAL
$ python ~/Downloads/ACES-master/compiler/tools/build_tools/CubeMX2Makefile.py . ~/Downloads/ACES-master/ FatFs-uSD
$ ~/Downloads/ACES-master/compiler/tools/build_record.sh
```

#### Run Binaries in record mode and build final binaries

Run openocd and connect to the board (STM32F469I_EVAL board):
```bash
$ cd /usr/local/share/openocd/scripts
$ sudo openocd -f interface/stlink.cfg -f target/stm32f4x.cfg
```

Then run the record binaries on the board to generate the white-lists then build the final binaries with enforce mode enabled.  It requires that openocd be running and connected to the board.
```
cd test_apps/pinlock/Decode/SW4STM32/STM32F4-DISCO
APP_NAME=<one of [FatFs-uSD, TCP-Echo, LCD-uSD, Animation]> {REPO_ROOT}/compiler/tools/build_final.sh record run
```
For example:
```
$ APP_NAME=FatFs-uSD ~/Downloads/ACES-master/compiler/tools/build_final.sh record run
```
If errors show: 
`arm-none-eabi-gdb-py: command not found`
you need to add newly installed gcc tool chain to the environment:
`export PATH=$PATH:/homt/t/Download/ACES-master/gcc/bins/bin`

For TCP Echo,

Need to connect an ethernet cable to the EVAL board and set computers IP address to 192.168.0.11/24

Run 
```
<REPO_ROOT>/compiler/tools/tcp_connect.py
```

### Using gdb to debug
Thanks to Naif S Almakhdhub, I got more information about this part.
#### compile arm-none-eabi-gdb
```
$ mkdir gdb
$ cd into gdb
extract attachment
$ mkdir build
$ cd build
$ ../gdb-7.11/configure --target=arm-none-eabi --prefix=${HOME}/arm/ --enable-interwork --enable-multilib --with-python
$ make
$ sudo make install
```

Then the gdb tool will then be in ~/arm/bin.

### Run gdb tool to debug
```
<YOUR_GDB> <BINARY_FILE> -x support_scripts/gdb_helpers.py
```
For example:
```
$ ~/arm/bin/arm-none-eabi-gdb FatFs-uSD--filename--mpu-8.elf -x ~/Downloads/ACES-master/compiler/tools/gdb_scripts/gdb_helpers.py
(gdb) py cl()
Reset_Handler () at startup_stm32f469xx.s:80
80    startup_stm32f469xx.s: No such file or directory.
Unable to match requested speed 2000 kHz, using 1800 kHz
Unable to match requested speed 2000 kHz, using 1800 kHz
target halted due to debug-request, current mode: Thread
xPSR: 0x01000000 pc: 0x0801a890 msp: 0x20000ffc
Loading section .isr_vector, size 0x1b8 lma 0x8000000
Loading section .text, size 0x1a838 lma 0x80001b8
Loading section .rodata, size 0x560 lma 0x801a9f0
Loading section .ARM, size 0x8 lma 0x801af50
Loading section .data, size 0xc8 lma 0x801af58
Start address 0x801a890, load size 110624
Transfer rate: 18 KB/sec, 9218 bytes/write.
(gdb) py mpu()
Reading 0
    Region 0
    Start: 0x0
    End: 0x1
    Size: 2, 0x2
    Permissions 26:24: 0x0 ,(P-,U-)
('\tExecute Never: ', 0)
    SCB 18:16, 0x0:
    TEX 21:19, 0x0:
('\tEnabled :', 0)
RBAR: 0x0
RASR: 0x0
----------------------------------------
...
```
Run cl() first to connect to the board. There are other functions we can use in `gdb_helpers.py`.