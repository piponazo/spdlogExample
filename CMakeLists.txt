cmake_minimum_required(VERSION 3.15)

project(spdlogExample
   VERSION 0.1.0.0
   DESCRIPTION "Sample project to setup spdlog when dealing with libraries + apps"
   LANGUAGES CXX
)

include(cmake/mainSetup.cmake         REQUIRED)
include(cmake/compilerFlags.cmake     REQUIRED)
include(cmake/findDependencies.cmake  REQUIRED)

add_subdirectory(lib)
add_subdirectory(app)
