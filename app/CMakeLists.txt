add_executable(myApp myApp.cpp)

target_link_libraries(myApp
  PRIVATE
    myLib
)

target_include_directories(myApp
  PRIVATE
    ${PROJECT_BINARY_DIR}
    ${CONAN_INCLUDE_DIRS_SPDLOG}
)
