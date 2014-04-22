# - Try to find the CHEWING libraries
# Once done this will define
#
#  CHEWING_FOUND - system has CHEWING
#  CHEWING_INCLUDE_DIR - the CHEWING include directory
#  CHEWING_LIBRARIES - CHEWING library
#
# Copyright (c) 2012 CSSlayer <wengxt@gmail.com>
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.

if(CHEWING_INCLUDE_DIR AND CHEWING_LIBRARIES AND CHEWING_DATADIR)
    # Already in cache, be silent
    set(CHEWING_FIND_QUIETLY TRUE)
endif(CHEWING_INCLUDE_DIR AND CHEWING_LIBRARIES AND CHEWING_DATADIR)

find_package(PkgConfig)
pkg_check_modules(PC_LIBCHEWING QUIET chewing)

find_path(CHEWING_MAIN_INCLUDE_DIR
          NAMES chewing.h
          HINTS ${PC_LIBCHEWING_INCLUDEDIR}
          PATH_SUFFIXES chewing)

find_library(CHEWING_LIBRARIES
             NAMES chewing
             HINTS ${PC_LIBCHEWING_LIBDIR})

set(CHEWING_INCLUDE_DIR "${CHEWING_MAIN_INCLUDE_DIR}")
set(CHEWING_FOUND ${PC_LIBCHEWING_FOUND})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Chewing FOUND_VAR CHEWING_FOUND
                                          REQUIRED_VARS CHEWING_LIBRARIES CHEWING_MAIN_INCLUDE_DIR
                                          VERSION_VAR PC_LIBCHEWING_VERSION)

mark_as_advanced(CHEWING_INCLUDE_DIR CHEWING_LIBRARIES)
