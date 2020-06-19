from conans import ConanFile
from conans.tools import os_info

class SpdlogExampleDeps(ConanFile):
    settings = 'os', 'compiler', 'build_type', 'arch'
    generators = 'cmake'

    def configure(self):
        self.options['spdlog'].shared = False
        self.options['spdlog'].header_only = True

    def requirements(self):
        self.requires('spdlog/1.6.1')

    def imports(self):
        self.copy('*.dll', dst='bin', src='bin')
