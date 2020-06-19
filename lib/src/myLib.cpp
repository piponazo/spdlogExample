#include <myLib/myLib.h>

#include <spdlog/sinks/stdout_color_sinks.h>
#include <spdlog/spdlog.h>

namespace myLib
{
  static const std::string logger_name = "example";

  std::shared_ptr<spdlog::logger> setup_logger(std::vector<spdlog::sink_ptr> sinks)
  {
    auto logger = spdlog::get(logger_name);
    if (!logger) {
      if (sinks.size() > 0) {
        logger = std::make_shared<spdlog::logger>(logger_name, std::begin(sinks), std::end(sinks));
        spdlog::register_logger(logger);
      } else {
        logger = spdlog::stdout_color_mt(logger_name);
      }
    }

    return logger;
  }

  void test(std::string message)
  {
    auto logger = spdlog::get(logger_name);
    if (logger) {
      logger->debug("{}::{}", __FUNCTION__, message);
    }
  }


}  // namespace myLib
