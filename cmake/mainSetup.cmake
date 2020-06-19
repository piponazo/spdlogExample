cmake_policy(SET CMP0091 NEW) # MSVC runtime library flags are selected by an abstraction.
cmake_policy(SET CMP0092 NEW) # MSVC warning flags are not in CMAKE_<LANG>_FLAGS by default.

include(GenerateExportHeader)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
