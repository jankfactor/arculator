# deps/sdl2.cmake - Fetch and configure SDL2

# First try to find system SDL2
find_package(SDL2 QUIET)

if(NOT SDL2_FOUND)
    message(STATUS "System SDL2 not found, fetching...")
    
    FetchContent_Declare(
        SDL2
        GIT_REPOSITORY https://github.com/libsdl-org/SDL.git
        GIT_TAG        release-2.30.10
        GIT_SHALLOW    TRUE
    )
    
    # SDL2 build options
    set(SDL_SHARED OFF CACHE BOOL "" FORCE)
    set(SDL_STATIC ON CACHE BOOL "" FORCE)
    set(SDL_TEST OFF CACHE BOOL "" FORCE)
    set(SDL2_DISABLE_INSTALL ON CACHE BOOL "" FORCE)
    
    FetchContent_MakeAvailable(SDL2)
    
    # Set variables for downstream use
    set(SDL2_INCLUDE_DIRS ${SDL2_SOURCE_DIR}/include)
    set(SDL2_LIBRARIES SDL2-static SDL2main)
    
    # Create alias if not exists
    if(NOT TARGET SDL2::SDL2)
        add_library(SDL2::SDL2 ALIAS SDL2-static)
    endif()
    if(NOT TARGET SDL2::SDL2main)
        add_library(SDL2::SDL2main ALIAS SDL2main)
    endif()
else()
    message(STATUS "Found system SDL2: ${SDL2_LIBRARIES}")
    
    # Handle different SDL2 find module outputs
    if(NOT SDL2_INCLUDE_DIRS)
        set(SDL2_INCLUDE_DIRS ${SDL2_INCLUDE_DIR})
    endif()
    
    # Create imported target if not created by find module
    if(NOT TARGET SDL2::SDL2)
        add_library(SDL2::SDL2 UNKNOWN IMPORTED)
        set_target_properties(SDL2::SDL2 PROPERTIES
            IMPORTED_LOCATION "${SDL2_LIBRARIES}"
            INTERFACE_INCLUDE_DIRECTORIES "${SDL2_INCLUDE_DIRS}"
        )
    endif()
endif()

