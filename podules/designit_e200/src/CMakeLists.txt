# Design IT E200 Access+ podule

set(DESIGNIT_E200_SOURCES
    designit_e200.c
    ${CMAKE_SOURCE_DIR}/podules/common/net/ne2000.c
    ${SLIRP_SOURCES}
)

if(OS_WINDOWS)
    list(APPEND DESIGNIT_E200_SOURCES ${CMAKE_SOURCE_DIR}/podules/common/net/net_pcap.c)
endif()

add_podule(designit_e200
    SOURCES ${DESIGNIT_E200_SOURCES}
    INCLUDE_DIRS
        ${CMAKE_SOURCE_DIR}/podules/common/net
        ${CMAKE_SOURCE_DIR}/podules/common/net/slirp
)

if(OS_WINDOWS)
    target_link_libraries(designit_e200 PRIVATE wsock32 iphlpapi)
endif()

