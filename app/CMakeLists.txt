add_executable(myApp myApp.cpp)

target_link_libraries(myApp
  PRIVATE
    myLib
    CONAN_PKG::spdlog
)

target_include_directories(myApp
  PRIVATE
    $<BUILD_INTERFACE:${PROJECT_BINARY_DIR}>
)
