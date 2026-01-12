# Ultimate CD-ROM podule

set(ULTIMATECDROM_SOURCES
    ultimatecdrom.c
    mitsumi.c
    ${CMAKE_SOURCE_DIR}/podules/common/sound/sound_out_sdl2.c
    ${CDROM_SOURCE}
)

add_podule(ultimatecdrom
    SOURCES ${ULTIMATECDROM_SOURCES}
    INCLUDE_DIRS
        ${CMAKE_SOURCE_DIR}/podules/common/cdrom
        ${CMAKE_SOURCE_DIR}/podules/common/sound
    LINK_LIBS
        ${SDL2_LIBRARIES}
)

