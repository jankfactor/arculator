# AKA12 podule

set(AKA12_SOURCES
    aka12.c
    ${CMAKE_SOURCE_DIR}/podules/common/misc/6522.c
    ${CMAKE_SOURCE_DIR}/podules/common/uart/scc2691.c
    ${MIDI_SOURCE}
)

add_podule(aka12
    SOURCES ${AKA12_SOURCES}
    INCLUDE_DIRS
        ${CMAKE_SOURCE_DIR}/podules/common/midi
        ${CMAKE_SOURCE_DIR}/podules/common/misc
        ${CMAKE_SOURCE_DIR}/podules/common/uart
)

if(OS_WINDOWS)
    target_link_libraries(aka12 PRIVATE winmm)
endif()

