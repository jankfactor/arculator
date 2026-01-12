# MIDI Max podule

set(MIDIMAX_SOURCES
    midimax.c
    ${CMAKE_SOURCE_DIR}/podules/common/uart/16550.c
    ${MIDI_SOURCE}
)

add_podule(midimax
    SOURCES ${MIDIMAX_SOURCES}
    INCLUDE_DIRS
        ${CMAKE_SOURCE_DIR}/podules/common/midi
        ${CMAKE_SOURCE_DIR}/podules/common/uart
)

if(OS_WINDOWS)
    target_link_libraries(midimax PRIVATE winmm)
endif()

