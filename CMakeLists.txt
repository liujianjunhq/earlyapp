#
# Copyright (C) 2018 Intel Corporation
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom
# the Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
# OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
# OR OTHER DEALINGS IN THE SOFTWARE.
#
# SPDX-License-Identifier: MIT
#

CMAKE_MINIMUM_REQUIRED(VERSION 3.12)

# Project name and version
PROJECT("earlyapp")
SET(PROJECT_VERSION_MAJOR 1)
SET(PROJECT_VERSION_MINOR 0)
SET(PROJECT_VERSION_PATCH 20)

# Version file.
CONFIGURE_FILE("version.h.in" ${CMAKE_BINARY_DIR}/include/EAVersion.h)

# Program executable.
SET(PROGRAM_EXE ${CMAKE_PROJECT_NAME})


# [Features]
#  - Log output
OPTION(USE_LOGOUTPUT "Control detailed log output to standard out" OFF)
IF(USE_LOGOUTPUT)
    ADD_DEFINITIONS(-DUSE_LOGOUTPUT -DBOOST_LOG_DYN_LINK)
ENDIF(USE_LOGOUTPUT)

#  - Log demsg output
OPTION(USE_DMESGLOG "Log output to dmesg log" OFF)
IF(USE_DMESGLOG)
    ADD_DEFINITIONS(-DUSE_DMESGLOG)
ENDIF(USE_DMESGLOG)


SUBDIRS(ext/MediaSDK/src ext/CameraICI/src ext/GLES2/src src)

# Service configuration
SUBDIRS(config)

# Resources files
SUBDIRS(res)

SUBDIRS(fastboot)

