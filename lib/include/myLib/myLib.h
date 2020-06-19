#pragma once

#include <spdlog/logger.h>
#include "myLib_export.h"

namespace myLib
{
MYLIB_EXPORT std::shared_ptr<spdlog::logger> setup_logger(std::vector<spdlog::sink_ptr> sinks);
MYLIB_EXPORT void test(std::string message);
MYLIB_EXPORT void testTrace(std::string message);

}
