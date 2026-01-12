# AKA16 podule

set(AKA16_SOURCES
    aka16.c
    ${CMAKE_SOURCE_DIR}/podules/common/uart/scc2691.c
    ${MIDI_SOURCE}
)

add_podule(aka16
    SOURCES ${AKA16_SOURCES}
    INCLUDE_DIRS
        ${CMAKE_SOURCE_DIR}/podules/common/midi
        ${CMAKE_SOURCE_DIR}/podules/common/uart
)

if(OS_WINDOWS)
    target_link_libraries(aka16 PRIVATE winmm)
endif()

