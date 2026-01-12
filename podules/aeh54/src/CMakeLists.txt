# Acorn AEH54 Ethernet III podule

set(AEH54_SOURCES
    aeh54.c
    seeq8005.c
    ${SLIRP_SOURCES}
)

if(OS_WINDOWS)
    list(APPEND AEH54_SOURCES ${CMAKE_SOURCE_DIR}/podules/common/net/net_pcap.c)
endif()

add_podule(aeh54
    SOURCES ${AEH54_SOURCES}
    INCLUDE_DIRS
        ${CMAKE_SOURCE_DIR}/podules/common/net
        ${CMAKE_SOURCE_DIR}/podules/common/net/slirp
)

if(OS_WINDOWS)
    target_link_libraries(aeh54 PRIVATE wsock32 iphlpapi)
endif()

