# Acorn AEH50 Ethernet II podule

set(AEH50_SOURCES
    aeh50.c
    ${CMAKE_SOURCE_DIR}/podules/common/net/ne2000.c
    ${SLIRP_SOURCES}
)

if(OS_WINDOWS)
    list(APPEND AEH50_SOURCES ${CMAKE_SOURCE_DIR}/podules/common/net/net_pcap.c)
endif()

add_podule(aeh50
    SOURCES ${AEH50_SOURCES}
    INCLUDE_DIRS
        ${CMAKE_SOURCE_DIR}/podules/common/net
        ${CMAKE_SOURCE_DIR}/podules/common/net/slirp
)

if(OS_WINDOWS)
    target_link_libraries(aeh50 PRIVATE wsock32 iphlpapi)
endif()

