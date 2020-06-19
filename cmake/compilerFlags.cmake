if (UNIX)
  add_compile_options(-Werror)                                            # Treat warnings as errors
  add_compile_options(-Wall -Wextra -Wshadow)                             # Recommended warnings flags
  add_compile_options(-Wcast-align)
  add_compile_options(-Wsign-conversion)
  add_compile_options(-Wunreachable-code)
  add_compile_options(-Wfloat-equal)
  add_compile_options(-Wformat=2)
  add_compile_options(-Woverlength-strings)
  add_compile_options(-Wunreachable-code)

  set(CMAKE_CXX_FLAGS_DEBUG "-g -O0")

  # This one triggers many warnings that are actually valid and will cause issues when fuzzing the
  # software. For example: uint_16 + uint16 can overflow.
  # add_compile_options(-Wconversion)

  # Only for clang
  # -Wheader-hygiene
endif()

if (MSVC)
  #set(CMAKE_CXX_FLAGS_DEBUG "/Zi /Ob0 /Od /Oy-") # Useful for running DrMemory
  set(CMAKE_CXX_FLAGS_RELEASE "/O2 /Ob2 /DNDEBUG /Zi /Zf") # Adding /Zi to the default options for generating PDBs
  set(CMAKE_EXE_LINKER_FLAGS_RELEASE "/DEBUG /OPT:REF /OPT:ICF")
  set(CMAKE_SHARED_LINKER_FLAGS_RELEASE "/DEBUG /OPT:REF /OPT:ICF")

  add_compile_options(/MP)
  add_compile_options(/WX)                                                # Treat warnings as errors
  add_compile_options(/W3)                                                # Warning level
  add_compile_options(/EHsc)

  add_definitions(-DNOMINMAX -DWIN32_LEAN_AND_MEAN)

  if (CMAKE_BUILD_TYPE STREQUAL Release)
    # We need to only apply this on release because the GTest dependency conflicts with this setting
    set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>") # Uses -MT[d]
  endif()
endif()
