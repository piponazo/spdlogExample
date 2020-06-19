# Check if the conan file exist to find the dependencies
if (EXISTS ${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
  include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
  conan_basic_setup(NO_OUTPUT_DIRS KEEP_RPATHS SKIP_STD TARGETS)
else()
  message(FATAL_ERROR "You need to run conan previously to bring the dependencies")
endif()
