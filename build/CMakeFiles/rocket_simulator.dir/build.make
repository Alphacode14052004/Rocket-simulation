# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/venkat/Documents/rocketsimulation

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/venkat/Documents/rocketsimulation/build

# Include any dependencies generated for this target.
include CMakeFiles/rocket_simulator.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/rocket_simulator.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/rocket_simulator.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/rocket_simulator.dir/flags.make

CMakeFiles/rocket_simulator.dir/rocket_simulator.c.o: CMakeFiles/rocket_simulator.dir/flags.make
CMakeFiles/rocket_simulator.dir/rocket_simulator.c.o: ../rocket_simulator.c
CMakeFiles/rocket_simulator.dir/rocket_simulator.c.o: CMakeFiles/rocket_simulator.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/venkat/Documents/rocketsimulation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/rocket_simulator.dir/rocket_simulator.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/rocket_simulator.dir/rocket_simulator.c.o -MF CMakeFiles/rocket_simulator.dir/rocket_simulator.c.o.d -o CMakeFiles/rocket_simulator.dir/rocket_simulator.c.o -c /home/venkat/Documents/rocketsimulation/rocket_simulator.c

CMakeFiles/rocket_simulator.dir/rocket_simulator.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rocket_simulator.dir/rocket_simulator.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/venkat/Documents/rocketsimulation/rocket_simulator.c > CMakeFiles/rocket_simulator.dir/rocket_simulator.c.i

CMakeFiles/rocket_simulator.dir/rocket_simulator.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rocket_simulator.dir/rocket_simulator.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/venkat/Documents/rocketsimulation/rocket_simulator.c -o CMakeFiles/rocket_simulator.dir/rocket_simulator.c.s

# Object files for target rocket_simulator
rocket_simulator_OBJECTS = \
"CMakeFiles/rocket_simulator.dir/rocket_simulator.c.o"

# External object files for target rocket_simulator
rocket_simulator_EXTERNAL_OBJECTS =

rocket_simulator: CMakeFiles/rocket_simulator.dir/rocket_simulator.c.o
rocket_simulator: CMakeFiles/rocket_simulator.dir/build.make
rocket_simulator: /usr/lib/x86_64-linux-gnu/libSDL2.so
rocket_simulator: CMakeFiles/rocket_simulator.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/venkat/Documents/rocketsimulation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable rocket_simulator"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rocket_simulator.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/rocket_simulator.dir/build: rocket_simulator
.PHONY : CMakeFiles/rocket_simulator.dir/build

CMakeFiles/rocket_simulator.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/rocket_simulator.dir/cmake_clean.cmake
.PHONY : CMakeFiles/rocket_simulator.dir/clean

CMakeFiles/rocket_simulator.dir/depend:
	cd /home/venkat/Documents/rocketsimulation/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/venkat/Documents/rocketsimulation /home/venkat/Documents/rocketsimulation /home/venkat/Documents/rocketsimulation/build /home/venkat/Documents/rocketsimulation/build /home/venkat/Documents/rocketsimulation/build/CMakeFiles/rocket_simulator.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/rocket_simulator.dir/depend
