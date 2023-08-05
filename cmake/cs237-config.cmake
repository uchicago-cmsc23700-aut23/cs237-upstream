# Feature checks used to generate the "cs237-config.h" file
#
# COPYRIGHT (c) 2023 John Reppy (http://cs.uchicago.edu/~jhr)
# All rights reserved.
#

set(CS237_BINARY_DIR ${CMAKE_BINARY_DIR})
set(CS237_SOURCE_DIR ${CMAKE_SOURCE_DIR})

# on Linux systems, we need <strings.h> for strcasencmp
#
check_symbol_exists (strncasecmp HAVE_STRNCASECMP)
if (NOT HAVE_STRNCASECMP)
  check_include_file(strings.h INCLUDE_STRINGS_H)
  if (INCLUDE_STRINGS_H)
    check_symbol_exists (strncasecmp INCLUDE_STRINGS_H HAVE_STRNCASECMP)
  endif()
endif()
