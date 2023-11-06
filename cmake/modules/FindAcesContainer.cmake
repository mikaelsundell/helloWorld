# Find AcesContainer headers and libraries.
#
# This module defines the following variables:
#
#   AcesContainer_FOUND         True if AcesContainer was found
#   AcesContainer_INCLUDE_DIRS  Where to find AcesContainer header files
#   AcesContainerR_LIBRARIES    List of AcesContainer libraries to link against

include (FindPackageHandleStandardArgs)

find_path (AcesContainer_INCLUDE_DIR NAMES aces/aces_types.h
           HINTS /usr/local/include
                 /usr/include
)

find_library (AcesContainer_LIBRARY NAMES AcesContainer
              PATH_SUFFIXES lib64 lib
              HINTS /usr/local
                    /usr
)

find_package_handle_standard_args (AcesContainer 
    DEFAULT_MSG
    AcesContainer_INCLUDE_DIR
    AcesContainer_LIBRARY
)

if (AcesContainer_FOUND)
    set (
        AcesContainer_INCLUDE_DIRS 
        ${AcesContainer_INCLUDE_DIR}
        ${AcesContainer_INCLUDE_DIR}/aces
    )
    set (
        AcesContainer_LIBRARIES 
        ${AcesContainer_LIBRARY}
    )
    add_library (AcesContainer::AcesContainer INTERFACE)
    target_include_directories (
        AcesContainer::AcesContainer 
        INTERFACE ${AcesContainer_INCLUDE_DIRS}
    )
    target_link_libraries (
        AcesContainer::AcesContainer 
        INTERFACE ${AcesContainer_LIBRARIES}
    )
else ()
    set (AcesContainer_INCLUDE_DIRS)
    set (AcesContainer_LIBRARIES)
endif ()

mark_as_advanced (
    AcesContainer_INCLUDE_DIR
    AcesContainer_LIBRARY
)