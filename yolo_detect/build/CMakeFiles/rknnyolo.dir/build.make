# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_SOURCE_DIR = /home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect/build

# Include any dependencies generated for this target.
include CMakeFiles/rknnyolo.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/rknnyolo.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/rknnyolo.dir/flags.make

CMakeFiles/rknnyolo.dir/src/drm_func.c.o: CMakeFiles/rknnyolo.dir/flags.make
CMakeFiles/rknnyolo.dir/src/drm_func.c.o: ../src/drm_func.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/rknnyolo.dir/src/drm_func.c.o"
	/home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/prebuilts/gcc/linux-x86/arm/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rknnyolo.dir/src/drm_func.c.o   -c /home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect/src/drm_func.c

CMakeFiles/rknnyolo.dir/src/drm_func.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rknnyolo.dir/src/drm_func.c.i"
	/home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/prebuilts/gcc/linux-x86/arm/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect/src/drm_func.c > CMakeFiles/rknnyolo.dir/src/drm_func.c.i

CMakeFiles/rknnyolo.dir/src/drm_func.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rknnyolo.dir/src/drm_func.c.s"
	/home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/prebuilts/gcc/linux-x86/arm/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect/src/drm_func.c -o CMakeFiles/rknnyolo.dir/src/drm_func.c.s

CMakeFiles/rknnyolo.dir/src/drm_func.c.o.requires:

.PHONY : CMakeFiles/rknnyolo.dir/src/drm_func.c.o.requires

CMakeFiles/rknnyolo.dir/src/drm_func.c.o.provides: CMakeFiles/rknnyolo.dir/src/drm_func.c.o.requires
	$(MAKE) -f CMakeFiles/rknnyolo.dir/build.make CMakeFiles/rknnyolo.dir/src/drm_func.c.o.provides.build
.PHONY : CMakeFiles/rknnyolo.dir/src/drm_func.c.o.provides

CMakeFiles/rknnyolo.dir/src/drm_func.c.o.provides.build: CMakeFiles/rknnyolo.dir/src/drm_func.c.o


CMakeFiles/rknnyolo.dir/src/rga_func.c.o: CMakeFiles/rknnyolo.dir/flags.make
CMakeFiles/rknnyolo.dir/src/rga_func.c.o: ../src/rga_func.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/rknnyolo.dir/src/rga_func.c.o"
	/home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/prebuilts/gcc/linux-x86/arm/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rknnyolo.dir/src/rga_func.c.o   -c /home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect/src/rga_func.c

CMakeFiles/rknnyolo.dir/src/rga_func.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rknnyolo.dir/src/rga_func.c.i"
	/home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/prebuilts/gcc/linux-x86/arm/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect/src/rga_func.c > CMakeFiles/rknnyolo.dir/src/rga_func.c.i

CMakeFiles/rknnyolo.dir/src/rga_func.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rknnyolo.dir/src/rga_func.c.s"
	/home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/prebuilts/gcc/linux-x86/arm/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect/src/rga_func.c -o CMakeFiles/rknnyolo.dir/src/rga_func.c.s

CMakeFiles/rknnyolo.dir/src/rga_func.c.o.requires:

.PHONY : CMakeFiles/rknnyolo.dir/src/rga_func.c.o.requires

CMakeFiles/rknnyolo.dir/src/rga_func.c.o.provides: CMakeFiles/rknnyolo.dir/src/rga_func.c.o.requires
	$(MAKE) -f CMakeFiles/rknnyolo.dir/build.make CMakeFiles/rknnyolo.dir/src/rga_func.c.o.provides.build
.PHONY : CMakeFiles/rknnyolo.dir/src/rga_func.c.o.provides

CMakeFiles/rknnyolo.dir/src/rga_func.c.o.provides.build: CMakeFiles/rknnyolo.dir/src/rga_func.c.o


CMakeFiles/rknnyolo.dir/src/postprocess.cc.o: CMakeFiles/rknnyolo.dir/flags.make
CMakeFiles/rknnyolo.dir/src/postprocess.cc.o: ../src/postprocess.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/rknnyolo.dir/src/postprocess.cc.o"
	/home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/prebuilts/gcc/linux-x86/arm/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rknnyolo.dir/src/postprocess.cc.o -c /home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect/src/postprocess.cc

CMakeFiles/rknnyolo.dir/src/postprocess.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rknnyolo.dir/src/postprocess.cc.i"
	/home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/prebuilts/gcc/linux-x86/arm/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect/src/postprocess.cc > CMakeFiles/rknnyolo.dir/src/postprocess.cc.i

CMakeFiles/rknnyolo.dir/src/postprocess.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rknnyolo.dir/src/postprocess.cc.s"
	/home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/prebuilts/gcc/linux-x86/arm/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect/src/postprocess.cc -o CMakeFiles/rknnyolo.dir/src/postprocess.cc.s

CMakeFiles/rknnyolo.dir/src/postprocess.cc.o.requires:

.PHONY : CMakeFiles/rknnyolo.dir/src/postprocess.cc.o.requires

CMakeFiles/rknnyolo.dir/src/postprocess.cc.o.provides: CMakeFiles/rknnyolo.dir/src/postprocess.cc.o.requires
	$(MAKE) -f CMakeFiles/rknnyolo.dir/build.make CMakeFiles/rknnyolo.dir/src/postprocess.cc.o.provides.build
.PHONY : CMakeFiles/rknnyolo.dir/src/postprocess.cc.o.provides

CMakeFiles/rknnyolo.dir/src/postprocess.cc.o.provides.build: CMakeFiles/rknnyolo.dir/src/postprocess.cc.o


CMakeFiles/rknnyolo.dir/src/lib_interface.cc.o: CMakeFiles/rknnyolo.dir/flags.make
CMakeFiles/rknnyolo.dir/src/lib_interface.cc.o: ../src/lib_interface.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/rknnyolo.dir/src/lib_interface.cc.o"
	/home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/prebuilts/gcc/linux-x86/arm/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rknnyolo.dir/src/lib_interface.cc.o -c /home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect/src/lib_interface.cc

CMakeFiles/rknnyolo.dir/src/lib_interface.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rknnyolo.dir/src/lib_interface.cc.i"
	/home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/prebuilts/gcc/linux-x86/arm/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect/src/lib_interface.cc > CMakeFiles/rknnyolo.dir/src/lib_interface.cc.i

CMakeFiles/rknnyolo.dir/src/lib_interface.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rknnyolo.dir/src/lib_interface.cc.s"
	/home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/prebuilts/gcc/linux-x86/arm/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf/bin/arm-linux-gnueabihf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect/src/lib_interface.cc -o CMakeFiles/rknnyolo.dir/src/lib_interface.cc.s

CMakeFiles/rknnyolo.dir/src/lib_interface.cc.o.requires:

.PHONY : CMakeFiles/rknnyolo.dir/src/lib_interface.cc.o.requires

CMakeFiles/rknnyolo.dir/src/lib_interface.cc.o.provides: CMakeFiles/rknnyolo.dir/src/lib_interface.cc.o.requires
	$(MAKE) -f CMakeFiles/rknnyolo.dir/build.make CMakeFiles/rknnyolo.dir/src/lib_interface.cc.o.provides.build
.PHONY : CMakeFiles/rknnyolo.dir/src/lib_interface.cc.o.provides

CMakeFiles/rknnyolo.dir/src/lib_interface.cc.o.provides.build: CMakeFiles/rknnyolo.dir/src/lib_interface.cc.o


# Object files for target rknnyolo
rknnyolo_OBJECTS = \
"CMakeFiles/rknnyolo.dir/src/drm_func.c.o" \
"CMakeFiles/rknnyolo.dir/src/rga_func.c.o" \
"CMakeFiles/rknnyolo.dir/src/postprocess.cc.o" \
"CMakeFiles/rknnyolo.dir/src/lib_interface.cc.o"

# External object files for target rknnyolo
rknnyolo_EXTERNAL_OBJECTS =

librknnyolo.a: CMakeFiles/rknnyolo.dir/src/drm_func.c.o
librknnyolo.a: CMakeFiles/rknnyolo.dir/src/rga_func.c.o
librknnyolo.a: CMakeFiles/rknnyolo.dir/src/postprocess.cc.o
librknnyolo.a: CMakeFiles/rknnyolo.dir/src/lib_interface.cc.o
librknnyolo.a: CMakeFiles/rknnyolo.dir/build.make
librknnyolo.a: CMakeFiles/rknnyolo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX static library librknnyolo.a"
	$(CMAKE_COMMAND) -P CMakeFiles/rknnyolo.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rknnyolo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/rknnyolo.dir/build: librknnyolo.a

.PHONY : CMakeFiles/rknnyolo.dir/build

CMakeFiles/rknnyolo.dir/requires: CMakeFiles/rknnyolo.dir/src/drm_func.c.o.requires
CMakeFiles/rknnyolo.dir/requires: CMakeFiles/rknnyolo.dir/src/rga_func.c.o.requires
CMakeFiles/rknnyolo.dir/requires: CMakeFiles/rknnyolo.dir/src/postprocess.cc.o.requires
CMakeFiles/rknnyolo.dir/requires: CMakeFiles/rknnyolo.dir/src/lib_interface.cc.o.requires

.PHONY : CMakeFiles/rknnyolo.dir/requires

CMakeFiles/rknnyolo.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/rknnyolo.dir/cmake_clean.cmake
.PHONY : CMakeFiles/rknnyolo.dir/clean

CMakeFiles/rknnyolo.dir/depend:
	cd /home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect /home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect /home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect/build /home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect/build /home/marc/rv1126_rv1109_linux_sdk_v1.8.0_20210224/external/rkmedia/examples/my_rknn_yolo/yolo_detect/build/CMakeFiles/rknnyolo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/rknnyolo.dir/depend

