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

# Utility rule file for LLVMHello_exports.

# Include the progress variables for this target.
include lib/Transforms/Hello/CMakeFiles/LLVMHello_exports.dir/progress.make

lib/Transforms/Hello/CMakeFiles/LLVMHello_exports: lib/Transforms/Hello/LLVMHello.exports

lib/Transforms/Hello/LLVMHello.exports: ../lib/Transforms/Hello/Hello.exports
	$(CMAKE_COMMAND) -E cmake_progress_report /home/suyog/llvm-leg/trunk/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Creating export file for LLVMHello"
	cd /home/suyog/llvm-leg/trunk/build/lib/Transforms/Hello && echo { > LLVMHello.exports
	cd /home/suyog/llvm-leg/trunk/build/lib/Transforms/Hello && grep -q [[:alnum:]] /home/suyog/llvm-leg/trunk/lib/Transforms/Hello/Hello.exports && echo "  global:" >> LLVMHello.exports || :
	cd /home/suyog/llvm-leg/trunk/build/lib/Transforms/Hello && sed -e "s/\$$/;/" -e "s/^/    /" < /home/suyog/llvm-leg/trunk/lib/Transforms/Hello/Hello.exports >> LLVMHello.exports
	cd /home/suyog/llvm-leg/trunk/build/lib/Transforms/Hello && echo "  local: *;" >> LLVMHello.exports
	cd /home/suyog/llvm-leg/trunk/build/lib/Transforms/Hello && echo "};" >> LLVMHello.exports

LLVMHello_exports: lib/Transforms/Hello/CMakeFiles/LLVMHello_exports
LLVMHello_exports: lib/Transforms/Hello/LLVMHello.exports
LLVMHello_exports: lib/Transforms/Hello/CMakeFiles/LLVMHello_exports.dir/build.make
.PHONY : LLVMHello_exports

# Rule to build all files generated by this target.
lib/Transforms/Hello/CMakeFiles/LLVMHello_exports.dir/build: LLVMHello_exports
.PHONY : lib/Transforms/Hello/CMakeFiles/LLVMHello_exports.dir/build

lib/Transforms/Hello/CMakeFiles/LLVMHello_exports.dir/clean:
	cd /home/suyog/llvm-leg/trunk/build/lib/Transforms/Hello && $(CMAKE_COMMAND) -P CMakeFiles/LLVMHello_exports.dir/cmake_clean.cmake
.PHONY : lib/Transforms/Hello/CMakeFiles/LLVMHello_exports.dir/clean

lib/Transforms/Hello/CMakeFiles/LLVMHello_exports.dir/depend:
	cd /home/suyog/llvm-leg/trunk/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/suyog/llvm-leg/trunk /home/suyog/llvm-leg/trunk/lib/Transforms/Hello /home/suyog/llvm-leg/trunk/build /home/suyog/llvm-leg/trunk/build/lib/Transforms/Hello /home/suyog/llvm-leg/trunk/build/lib/Transforms/Hello/CMakeFiles/LLVMHello_exports.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/Transforms/Hello/CMakeFiles/LLVMHello_exports.dir/depend

