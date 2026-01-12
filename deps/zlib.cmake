# deps/zlib.cmake - Fetch and configure zlib

# First try to find system zlib
find_package(ZLIB QUIET)

if(NOT ZLIB_FOUND)
    message(STATUS "System zlib not found, fetching...")
    
    FetchContent_Declare(
        zlib
        GIT_REPOSITORY https://github.com/madler/zlib.git
        GIT_TAG        v1.3.1
        GIT_SHALLOW    TRUE
    )
    
    # Prevent zlib from installing to system
    set(ZLIB_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
    set(SKIP_INSTALL_ALL ON CACHE BOOL "" FORCE)
    
    FetchContent_MakeAvailable(zlib)
    
    # Create alias target for consistency
    if(NOT TARGET ZLIB::ZLIB)
        add_library(ZLIB::ZLIB ALIAS zlibstatic)
    endif()
    
    set(ZLIB_INCLUDE_DIRS ${zlib_SOURCE_DIR} ${zlib_BINARY_DIR})
    set(ZLIB_LIBRARIES zlibstatic)
else()
    message(STATUS "Found system zlib: ${ZLIB_LIBRARIES}")
endif()

