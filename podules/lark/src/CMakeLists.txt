# Lark podule

set(LARK_SOURCES
    lark.c
    ad1848.c
    am7202a.c
    ${CMAKE_SOURCE_DIR}/podules/common/uart/16550.c
    ${CMAKE_SOURCE_DIR}/podules/common/sound/sound_out_sdl2.c
    ${MIDI_SOURCE}
    ${SOUND_IN_SOURCE}
)

add_podule(lark
    SOURCES ${LARK_SOURCES}
    INCLUDE_DIRS
        ${CMAKE_SOURCE_DIR}/podules/common/midi
        ${CMAKE_SOURCE_DIR}/podules/common/sound
        ${CMAKE_SOURCE_DIR}/podules/common/uart
    LINK_LIBS
        ${SDL2_LIBRARIES}
)

if(OS_WINDOWS)
    target_link_libraries(lark PRIVATE winmm)
endif()

