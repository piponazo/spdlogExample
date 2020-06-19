#include <myLib/myLib.h>

#include <spdlog/logger.h>
#include <spdlog/spdlog.h>
#include <spdlog/sinks/daily_file_sink.h>
#include <spdlog/sinks/stdout_sinks.h>

#include <iostream>

int main()
{
  std::cout << "Hello world!" << std::endl;

  // Let's use the library
  std::vector<spdlog::sink_ptr> sinks;
  sinks.push_back(std::make_shared<spdlog::sinks::stdout_sink_st>());
  sinks.push_back(std::make_shared<spdlog::sinks::daily_file_sink_st>("logfile", 23, 59));

  auto logger = myLib::setup_logger(sinks);

  spdlog::set_level(spdlog::level::level_enum::debug); // No effect for the library.
  myLib::test("message 1"); // No logging

  //spdlog::register_logger(logger);

  // Now this will also affect the library logger
  spdlog::set_level(spdlog::level::level_enum::debug);

  myLib::test("message 2"); // Hurray !

  spdlog::shutdown();

  return EXIT_SUCCESS;
}
