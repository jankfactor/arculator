# AKA31 podule

set(AKA31_SOURCES
    aka31.c
    d71071l.c
    wd33c93a.c
    ${SCSI_COMMON_SOURCES}
    ${CMAKE_SOURCE_DIR}/podules/common/sound/sound_out_sdl2.c
    ${CDROM_SOURCE}
)

add_podule(aka31
    SOURCES ${AKA31_SOURCES}
    INCLUDE_DIRS
        ${CMAKE_SOURCE_DIR}/podules/common/cdrom
        ${CMAKE_SOURCE_DIR}/podules/common/sound
        ${CMAKE_SOURCE_DIR}/podules/common/scsi
    LINK_LIBS
        ${SDL2_LIBRARIES}
)

