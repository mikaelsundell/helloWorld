# Find Imath headers and libraries.
#
# This module can take the following variables to define
# custom search locations:
#
#   ILMBASE_ROOT
#   ILMBASE_LOCATION
#
# This module defines the following variables:
#
#   Imath_FOUND         True if Imath was found
#   Imath_INCLUDE_DIRS  Where to find Imath header files
#   Imath_LIBRARIES     List of Imath libraries to link against

include (FindPackageHandleStandardArgs)

find_path (Imath_INCLUDE_DIR NAMES Imath/ImathVec.h
           HINTS ${ILMBASE_ROOT}
                 ${ILMBASE_LOCATION}
                 /usr/local/include
                 /usr/include
)

find_library (Imath_MATH_LIBRARY NAMES Imath-3_1 Imath-3_1_d Imath
              PATH_SUFFIXES lib64 lib
              HINTS ${ILMBASE_ROOT}
                    ${ILMBASE_LOCATION}
                    /usr/local
                    /usr
)
find_library (Imath_IEX_LIBRARY NAMES Iex-3_1 Iex-3_1_d Iex
              PATH_SUFFIXES lib64 lib
              HINTS ${ILMBASE_ROOT}
                    ${ILMBASE_LOCATION}
                    /usr/local
                    /usr
)

find_package_handle_standard_args (Imath 
    DEFAULT_MSG
    Imath_INCLUDE_DIR
    Imath_MATH_LIBRARY
    Imath_IEX_LIBRARY
)

if (Imath_FOUND)
    set (Imath_INCLUDE_DIRS 
        ${Imath_INCLUDE_DIR}
        ${Imath_INCLUDE_DIR}/imath 
    )
    set (Imath_LIBRARIES
        ${Imath_MATH_LIBRARY}
        ${Imath_IEX_LIBRARY}
    )
    add_library (Imath::Imath INTERFACE)
    target_include_directories (
        Imath::Imath 
        INTERFACE ${Imath_INCLUDE_DIRS}
    )
    target_link_libraries (
        Imath::Imath 
        INTERFACE ${Imath_LIBRARIES}
    )
else ()
    set (Imath_INCLUDE_DIRS)
    set (Imath_LIBRARIES)
endif ()

mark_as_advanced (
    Imath_INCLUDE_DIR
    Imath_IEX_LIBRARY
    Imath_MATH_LIBRARY
)