# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/suyog/llvm-leg/trunk

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/suyog/llvm-leg/trunk/build

# Utility rule file for TOYCommonTableGen.

# Include the progress variables for this target.
include lib/Target/TOY/CMakeFiles/TOYCommonTableGen.dir/progress.make

lib/Target/TOY/CMakeFiles/TOYCommonTableGen: lib/Target/TOY/TOYGenRegisterInfo.inc
lib/Target/TOY/CMakeFiles/TOYCommonTableGen: lib/Target/TOY/TOYGenInstrInfo.inc
lib/Target/TOY/CMakeFiles/TOYCommonTableGen: lib/Target/TOY/TOYGenAsmWriter.inc
lib/Target/TOY/CMakeFiles/TOYCommonTableGen: lib/Target/TOY/TOYGenDAGISel.inc
lib/Target/TOY/CMakeFiles/TOYCommonTableGen: lib/Target/TOY/TOYGenCallingConv.inc
lib/Target/TOY/CMakeFiles/TOYCommonTableGen: lib/Target/TOY/TOYGenSubtargetInfo.inc
lib/Target/TOY/CMakeFiles/TOYCommonTableGen: lib/Target/TOY/TOYGenMCCodeEmitter.inc

lib/Target/TOY/TOYGenRegisterInfo.inc: lib/Target/TOY/TOYGenRegisterInfo.inc.tmp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/suyog/llvm-leg/trunk/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Updating TOYGenRegisterInfo.inc..."
	cd /home/suyog/llvm-leg/trunk/build/lib/Target/TOY && /usr/bin/cmake -E copy_if_different /home/suyog/llvm-leg/trunk/build/lib/Target/TOY/TOYGenRegisterInfo.inc.tmp /home/suyog/llvm-leg/trunk/build/lib/Target/TOY/TOYGenRegisterInfo.inc

lib/Target/TOY/TOYGenInstrInfo.inc: lib/Target/TOY/TOYGenInstrInfo.inc.tmp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/suyog/llvm-leg/trunk/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Updating TOYGenInstrInfo.inc..."
	cd /home/suyog/llvm-leg/trunk/build/lib/Target/TOY && /usr/bin/cmake -E copy_if_different /home/suyog/llvm-leg/trunk/build/lib/Target/TOY/TOYGenInstrInfo.inc.tmp /home/suyog/llvm-leg/trunk/build/lib/Target/TOY/TOYGenInstrInfo.inc

lib/Target/TOY/TOYGenAsmWriter.inc: lib/Target/TOY/TOYGenAsmWriter.inc.tmp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/suyog/llvm-leg/trunk/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Updating TOYGenAsmWriter.inc..."
	cd /home/suyog/llvm-leg/trunk/build/lib/Target/TOY && /usr/bin/cmake -E copy_if_different /home/suyog/llvm-leg/trunk/build/lib/Target/TOY/TOYGenAsmWriter.inc.tmp /home/suyog/llvm-leg/trunk/build/lib/Target/TOY/TOYGenAsmWriter.inc

lib/Target/TOY/TOYGenDAGISel.inc: lib/Target/TOY/TOYGenDAGISel.inc.tmp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/suyog/llvm-leg/trunk/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Updating TOYGenDAGISel.inc..."
	cd /home/suyog/llvm-leg/trunk/build/lib/Target/TOY && /usr/bin/cmake -E copy_if_different /home/suyog/llvm-leg/trunk/build/lib/Target/TOY/TOYGenDAGISel.inc.tmp /home/suyog/llvm-leg/trunk/build/lib/Target/TOY/TOYGenDAGISel.inc

lib/Target/TOY/TOYGenCallingConv.inc: lib/Target/TOY/TOYGenCallingConv.inc.tmp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/suyog/llvm-leg/trunk/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Updating TOYGenCallingConv.inc..."
	cd /home/suyog/llvm-leg/trunk/build/lib/Target/TOY && /usr/bin/cmake -E copy_if_different /home/suyog/llvm-leg/trunk/build/lib/Target/TOY/TOYGenCallingConv.inc.tmp /home/suyog/llvm-leg/trunk/build/lib/Target/TOY/TOYGenCallingConv.inc

lib/Target/TOY/TOYGenSubtargetInfo.inc: lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/suyog/llvm-leg/trunk/build/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Updating TOYGenSubtargetInfo.inc..."
	cd /home/suyog/llvm-leg/trunk/build/lib/Target/TOY && /usr/bin/cmake -E copy_if_different /home/suyog/llvm-leg/trunk/build/lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp /home/suyog/llvm-leg/trunk/build/lib/Target/TOY/TOYGenSubtargetInfo.inc

lib/Target/TOY/TOYGenMCCodeEmitter.inc: lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/suyog/llvm-leg/trunk/build/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Updating TOYGenMCCodeEmitter.inc..."
	cd /home/suyog/llvm-leg/trunk/build/lib/Target/TOY && /usr/bin/cmake -E copy_if_different /home/suyog/llvm-leg/trunk/build/lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp /home/suyog/llvm-leg/trunk/build/lib/Target/TOY/TOYGenMCCodeEmitter.inc

lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: bin/llvm-tblgen
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../lib/Target/TOY/TOYRegisterInfo.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../lib/Target/TOY/TOYOperators.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../lib/Target/TOY/TOYCallingConv.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../lib/Target/TOY/TOYInstrInfo.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../lib/Target/TOY/TOYInstrFormats.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../lib/Target/TOY/TOY.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../include/llvm/Option/OptParser.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../include/llvm/Target/TargetSchedule.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../include/llvm/Target/TargetSelectionDAG.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../include/llvm/Target/TargetItinerary.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../include/llvm/Target/TargetCallingConv.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../include/llvm/Target/Target.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../include/llvm/IR/IntrinsicsMips.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../include/llvm/IR/IntrinsicsHexagon.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../include/llvm/IR/IntrinsicsAArch64.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../include/llvm/IR/IntrinsicsXCore.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../include/llvm/IR/IntrinsicsPowerPC.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../include/llvm/IR/IntrinsicsX86.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../include/llvm/IR/IntrinsicsARM.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../include/llvm/IR/Intrinsics.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../include/llvm/IR/IntrinsicsR600.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../include/llvm/IR/IntrinsicsNVVM.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../include/llvm/CodeGen/ValueTypes.td
lib/Target/TOY/TOYGenRegisterInfo.inc.tmp: ../lib/Target/TOY/TOY.td
	$(CMAKE_COMMAND) -E cmake_progress_report /home/suyog/llvm-leg/trunk/build/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Building TOYGenRegisterInfo.inc..."
	cd /home/suyog/llvm-leg/trunk/build/lib/Target/TOY && ../../../bin/llvm-tblgen -gen-register-info -I /home/suyog/llvm-leg/trunk/lib/Target/TOY -I /home/suyog/llvm-leg/trunk/lib/Target -I /home/suyog/llvm-leg/trunk/include /home/suyog/llvm-leg/trunk/lib/Target/TOY/TOY.td -o /home/suyog/llvm-leg/trunk/build/lib/Target/TOY/TOYGenRegisterInfo.inc.tmp

lib/Target/TOY/TOYGenInstrInfo.inc.tmp: bin/llvm-tblgen
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../lib/Target/TOY/TOYRegisterInfo.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../lib/Target/TOY/TOYOperators.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../lib/Target/TOY/TOYCallingConv.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../lib/Target/TOY/TOYInstrInfo.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../lib/Target/TOY/TOYInstrFormats.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../lib/Target/TOY/TOY.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../include/llvm/Option/OptParser.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../include/llvm/Target/TargetSchedule.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../include/llvm/Target/TargetSelectionDAG.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../include/llvm/Target/TargetItinerary.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../include/llvm/Target/TargetCallingConv.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../include/llvm/Target/Target.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../include/llvm/IR/IntrinsicsMips.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../include/llvm/IR/IntrinsicsHexagon.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../include/llvm/IR/IntrinsicsAArch64.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../include/llvm/IR/IntrinsicsXCore.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../include/llvm/IR/IntrinsicsPowerPC.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../include/llvm/IR/IntrinsicsX86.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../include/llvm/IR/IntrinsicsARM.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../include/llvm/IR/Intrinsics.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../include/llvm/IR/IntrinsicsR600.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../include/llvm/IR/IntrinsicsNVVM.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../include/llvm/CodeGen/ValueTypes.td
lib/Target/TOY/TOYGenInstrInfo.inc.tmp: ../lib/Target/TOY/TOY.td
	$(CMAKE_COMMAND) -E cmake_progress_report /home/suyog/llvm-leg/trunk/build/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Building TOYGenInstrInfo.inc..."
	cd /home/suyog/llvm-leg/trunk/build/lib/Target/TOY && ../../../bin/llvm-tblgen -gen-instr-info -I /home/suyog/llvm-leg/trunk/lib/Target/TOY -I /home/suyog/llvm-leg/trunk/lib/Target -I /home/suyog/llvm-leg/trunk/include /home/suyog/llvm-leg/trunk/lib/Target/TOY/TOY.td -o /home/suyog/llvm-leg/trunk/build/lib/Target/TOY/TOYGenInstrInfo.inc.tmp

lib/Target/TOY/TOYGenAsmWriter.inc.tmp: bin/llvm-tblgen
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../lib/Target/TOY/TOYRegisterInfo.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../lib/Target/TOY/TOYOperators.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../lib/Target/TOY/TOYCallingConv.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../lib/Target/TOY/TOYInstrInfo.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../lib/Target/TOY/TOYInstrFormats.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../lib/Target/TOY/TOY.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../include/llvm/Option/OptParser.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../include/llvm/Target/TargetSchedule.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../include/llvm/Target/TargetSelectionDAG.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../include/llvm/Target/TargetItinerary.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../include/llvm/Target/TargetCallingConv.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../include/llvm/Target/Target.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../include/llvm/IR/IntrinsicsMips.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../include/llvm/IR/IntrinsicsHexagon.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../include/llvm/IR/IntrinsicsAArch64.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../include/llvm/IR/IntrinsicsXCore.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../include/llvm/IR/IntrinsicsPowerPC.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../include/llvm/IR/IntrinsicsX86.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../include/llvm/IR/IntrinsicsARM.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../include/llvm/IR/Intrinsics.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../include/llvm/IR/IntrinsicsR600.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../include/llvm/IR/IntrinsicsNVVM.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../include/llvm/CodeGen/ValueTypes.td
lib/Target/TOY/TOYGenAsmWriter.inc.tmp: ../lib/Target/TOY/TOY.td
	$(CMAKE_COMMAND) -E cmake_progress_report /home/suyog/llvm-leg/trunk/build/CMakeFiles $(CMAKE_PROGRESS_10)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Building TOYGenAsmWriter.inc..."
	cd /home/suyog/llvm-leg/trunk/build/lib/Target/TOY && ../../../bin/llvm-tblgen -gen-asm-writer -I /home/suyog/llvm-leg/trunk/lib/Target/TOY -I /home/suyog/llvm-leg/trunk/lib/Target -I /home/suyog/llvm-leg/trunk/include /home/suyog/llvm-leg/trunk/lib/Target/TOY/TOY.td -o /home/suyog/llvm-leg/trunk/build/lib/Target/TOY/TOYGenAsmWriter.inc.tmp

lib/Target/TOY/TOYGenDAGISel.inc.tmp: bin/llvm-tblgen
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../lib/Target/TOY/TOYRegisterInfo.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../lib/Target/TOY/TOYOperators.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../lib/Target/TOY/TOYCallingConv.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../lib/Target/TOY/TOYInstrInfo.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../lib/Target/TOY/TOYInstrFormats.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../lib/Target/TOY/TOY.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../include/llvm/Option/OptParser.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../include/llvm/Target/TargetSchedule.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../include/llvm/Target/TargetSelectionDAG.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../include/llvm/Target/TargetItinerary.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../include/llvm/Target/TargetCallingConv.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../include/llvm/Target/Target.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../include/llvm/IR/IntrinsicsMips.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../include/llvm/IR/IntrinsicsHexagon.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../include/llvm/IR/IntrinsicsAArch64.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../include/llvm/IR/IntrinsicsXCore.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../include/llvm/IR/IntrinsicsPowerPC.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../include/llvm/IR/IntrinsicsX86.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../include/llvm/IR/IntrinsicsARM.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../include/llvm/IR/Intrinsics.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../include/llvm/IR/IntrinsicsR600.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../include/llvm/IR/IntrinsicsNVVM.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../include/llvm/CodeGen/ValueTypes.td
lib/Target/TOY/TOYGenDAGISel.inc.tmp: ../lib/Target/TOY/TOY.td
	$(CMAKE_COMMAND) -E cmake_progress_report /home/suyog/llvm-leg/trunk/build/CMakeFiles $(CMAKE_PROGRESS_11)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Building TOYGenDAGISel.inc..."
	cd /home/suyog/llvm-leg/trunk/build/lib/Target/TOY && ../../../bin/llvm-tblgen -gen-dag-isel -I /home/suyog/llvm-leg/trunk/lib/Target/TOY -I /home/suyog/llvm-leg/trunk/lib/Target -I /home/suyog/llvm-leg/trunk/include /home/suyog/llvm-leg/trunk/lib/Target/TOY/TOY.td -o /home/suyog/llvm-leg/trunk/build/lib/Target/TOY/TOYGenDAGISel.inc.tmp

lib/Target/TOY/TOYGenCallingConv.inc.tmp: bin/llvm-tblgen
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../lib/Target/TOY/TOYRegisterInfo.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../lib/Target/TOY/TOYOperators.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../lib/Target/TOY/TOYCallingConv.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../lib/Target/TOY/TOYInstrInfo.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../lib/Target/TOY/TOYInstrFormats.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../lib/Target/TOY/TOY.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../include/llvm/Option/OptParser.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../include/llvm/Target/TargetSchedule.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../include/llvm/Target/TargetSelectionDAG.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../include/llvm/Target/TargetItinerary.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../include/llvm/Target/TargetCallingConv.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../include/llvm/Target/Target.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../include/llvm/IR/IntrinsicsMips.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../include/llvm/IR/IntrinsicsHexagon.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../include/llvm/IR/IntrinsicsAArch64.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../include/llvm/IR/IntrinsicsXCore.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../include/llvm/IR/IntrinsicsPowerPC.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../include/llvm/IR/IntrinsicsX86.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../include/llvm/IR/IntrinsicsARM.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../include/llvm/IR/Intrinsics.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../include/llvm/IR/IntrinsicsR600.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../include/llvm/IR/IntrinsicsNVVM.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../include/llvm/CodeGen/ValueTypes.td
lib/Target/TOY/TOYGenCallingConv.inc.tmp: ../lib/Target/TOY/TOY.td
	$(CMAKE_COMMAND) -E cmake_progress_report /home/suyog/llvm-leg/trunk/build/CMakeFiles $(CMAKE_PROGRESS_12)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Building TOYGenCallingConv.inc..."
	cd /home/suyog/llvm-leg/trunk/build/lib/Target/TOY && ../../../bin/llvm-tblgen -gen-callingconv -I /home/suyog/llvm-leg/trunk/lib/Target/TOY -I /home/suyog/llvm-leg/trunk/lib/Target -I /home/suyog/llvm-leg/trunk/include /home/suyog/llvm-leg/trunk/lib/Target/TOY/TOY.td -o /home/suyog/llvm-leg/trunk/build/lib/Target/TOY/TOYGenCallingConv.inc.tmp

lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: bin/llvm-tblgen
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../lib/Target/TOY/TOYRegisterInfo.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../lib/Target/TOY/TOYOperators.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../lib/Target/TOY/TOYCallingConv.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../lib/Target/TOY/TOYInstrInfo.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../lib/Target/TOY/TOYInstrFormats.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../lib/Target/TOY/TOY.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../include/llvm/Option/OptParser.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../include/llvm/Target/TargetSchedule.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../include/llvm/Target/TargetSelectionDAG.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../include/llvm/Target/TargetItinerary.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../include/llvm/Target/TargetCallingConv.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../include/llvm/Target/Target.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../include/llvm/IR/IntrinsicsMips.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../include/llvm/IR/IntrinsicsHexagon.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../include/llvm/IR/IntrinsicsAArch64.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../include/llvm/IR/IntrinsicsXCore.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../include/llvm/IR/IntrinsicsPowerPC.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../include/llvm/IR/IntrinsicsX86.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../include/llvm/IR/IntrinsicsARM.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../include/llvm/IR/Intrinsics.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../include/llvm/IR/IntrinsicsR600.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../include/llvm/IR/IntrinsicsNVVM.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../include/llvm/CodeGen/ValueTypes.td
lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp: ../lib/Target/TOY/TOY.td
	$(CMAKE_COMMAND) -E cmake_progress_report /home/suyog/llvm-leg/trunk/build/CMakeFiles $(CMAKE_PROGRESS_13)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Building TOYGenSubtargetInfo.inc..."
	cd /home/suyog/llvm-leg/trunk/build/lib/Target/TOY && ../../../bin/llvm-tblgen -gen-subtarget -I /home/suyog/llvm-leg/trunk/lib/Target/TOY -I /home/suyog/llvm-leg/trunk/lib/Target -I /home/suyog/llvm-leg/trunk/include /home/suyog/llvm-leg/trunk/lib/Target/TOY/TOY.td -o /home/suyog/llvm-leg/trunk/build/lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp

lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: bin/llvm-tblgen
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../lib/Target/TOY/TOYRegisterInfo.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../lib/Target/TOY/TOYOperators.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../lib/Target/TOY/TOYCallingConv.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../lib/Target/TOY/TOYInstrInfo.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../lib/Target/TOY/TOYInstrFormats.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../lib/Target/TOY/TOY.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../include/llvm/Option/OptParser.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../include/llvm/Target/TargetSchedule.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../include/llvm/Target/TargetSelectionDAG.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../include/llvm/Target/TargetItinerary.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../include/llvm/Target/TargetCallingConv.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../include/llvm/Target/Target.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../include/llvm/IR/IntrinsicsMips.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../include/llvm/IR/IntrinsicsHexagon.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../include/llvm/IR/IntrinsicsAArch64.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../include/llvm/IR/IntrinsicsXCore.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../include/llvm/IR/IntrinsicsPowerPC.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../include/llvm/IR/IntrinsicsX86.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../include/llvm/IR/IntrinsicsARM.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../include/llvm/IR/Intrinsics.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../include/llvm/IR/IntrinsicsR600.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../include/llvm/IR/IntrinsicsNVVM.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../include/llvm/CodeGen/ValueTypes.td
lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp: ../lib/Target/TOY/TOY.td
	$(CMAKE_COMMAND) -E cmake_progress_report /home/suyog/llvm-leg/trunk/build/CMakeFiles $(CMAKE_PROGRESS_14)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Building TOYGenMCCodeEmitter.inc..."
	cd /home/suyog/llvm-leg/trunk/build/lib/Target/TOY && ../../../bin/llvm-tblgen -gen-emitter -I /home/suyog/llvm-leg/trunk/lib/Target/TOY -I /home/suyog/llvm-leg/trunk/lib/Target -I /home/suyog/llvm-leg/trunk/include /home/suyog/llvm-leg/trunk/lib/Target/TOY/TOY.td -o /home/suyog/llvm-leg/trunk/build/lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp

TOYCommonTableGen: lib/Target/TOY/CMakeFiles/TOYCommonTableGen
TOYCommonTableGen: lib/Target/TOY/TOYGenRegisterInfo.inc
TOYCommonTableGen: lib/Target/TOY/TOYGenInstrInfo.inc
TOYCommonTableGen: lib/Target/TOY/TOYGenAsmWriter.inc
TOYCommonTableGen: lib/Target/TOY/TOYGenDAGISel.inc
TOYCommonTableGen: lib/Target/TOY/TOYGenCallingConv.inc
TOYCommonTableGen: lib/Target/TOY/TOYGenSubtargetInfo.inc
TOYCommonTableGen: lib/Target/TOY/TOYGenMCCodeEmitter.inc
TOYCommonTableGen: lib/Target/TOY/TOYGenRegisterInfo.inc.tmp
TOYCommonTableGen: lib/Target/TOY/TOYGenInstrInfo.inc.tmp
TOYCommonTableGen: lib/Target/TOY/TOYGenAsmWriter.inc.tmp
TOYCommonTableGen: lib/Target/TOY/TOYGenDAGISel.inc.tmp
TOYCommonTableGen: lib/Target/TOY/TOYGenCallingConv.inc.tmp
TOYCommonTableGen: lib/Target/TOY/TOYGenSubtargetInfo.inc.tmp
TOYCommonTableGen: lib/Target/TOY/TOYGenMCCodeEmitter.inc.tmp
TOYCommonTableGen: lib/Target/TOY/CMakeFiles/TOYCommonTableGen.dir/build.make
.PHONY : TOYCommonTableGen

# Rule to build all files generated by this target.
lib/Target/TOY/CMakeFiles/TOYCommonTableGen.dir/build: TOYCommonTableGen
.PHONY : lib/Target/TOY/CMakeFiles/TOYCommonTableGen.dir/build

lib/Target/TOY/CMakeFiles/TOYCommonTableGen.dir/clean:
	cd /home/suyog/llvm-leg/trunk/build/lib/Target/TOY && $(CMAKE_COMMAND) -P CMakeFiles/TOYCommonTableGen.dir/cmake_clean.cmake
.PHONY : lib/Target/TOY/CMakeFiles/TOYCommonTableGen.dir/clean

lib/Target/TOY/CMakeFiles/TOYCommonTableGen.dir/depend:
	cd /home/suyog/llvm-leg/trunk/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/suyog/llvm-leg/trunk /home/suyog/llvm-leg/trunk/lib/Target/TOY /home/suyog/llvm-leg/trunk/build /home/suyog/llvm-leg/trunk/build/lib/Target/TOY /home/suyog/llvm-leg/trunk/build/lib/Target/TOY/CMakeFiles/TOYCommonTableGen.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/Target/TOY/CMakeFiles/TOYCommonTableGen.dir/depend
