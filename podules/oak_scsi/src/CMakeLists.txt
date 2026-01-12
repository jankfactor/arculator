# Oak SCSI podule

set(OAK_SCSI_SOURCES
    oak_scsi.c
    ncr5380.c
    ${SCSI_COMMON_SOURCES}
    ${CMAKE_SOURCE_DIR}/podules/common/sound/sound_out_sdl2.c
    ${CMAKE_SOURCE_DIR}/podules/common/eeprom/93c06.c
    ${CDROM_SOURCE}
)

add_podule(oak_scsi
    SOURCES ${OAK_SCSI_SOURCES}
    INCLUDE_DIRS
        ${CMAKE_SOURCE_DIR}/podules/common/cdrom
        ${CMAKE_SOURCE_DIR}/podules/common/eeprom
        ${CMAKE_SOURCE_DIR}/podules/common/sound
        ${CMAKE_SOURCE_DIR}/podules/common/scsi
    LINK_LIBS
        ${SDL2_LIBRARIES}
)

