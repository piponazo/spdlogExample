add_library(myLib
  src/myLib.cpp
  include/myLib/myLib.h
)

generate_export_header(myLib
  EXPORT_FILE_NAME ${PROJECT_BINARY_DIR}/myLib_export.h
)

target_link_libraries(myLib PRIVATE CONAN_PKG::spdlog)
#target_compile_definitions(myLib PRIVATE SPDLOG_ACTIVE_LEVEL=0)

target_compile_features(myLib PRIVATE cxx_std_11)

target_include_directories(myLib
  PUBLIC
    $<INSTALL_INTERFACE:include>
    $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/lib/include>
  PRIVATE
    $<BUILD_INTERFACE:${PROJECT_BINARY_DIR}>
)

