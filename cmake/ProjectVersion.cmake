include(GitInfo)

# Define current version.
set(TEMPLATE_NAME_VERSION_MAJOR 0)
set(TEMPLATE_NAME_VERSION_MINOR 1)
set(TEMPLATE_NAME_VERSION_PATCH 0)

set(TEMPLATE_NAME_VERSION
    ${TEMPLATE_NAME_VERSION_MAJOR}.${TEMPLATE_NAME_VERSION_MINOR}.${TEMPLATE_NAME_VERSION_PATCH})

set(TEMPLATE_NAME_VERSION_SHORT ${TEMPLATE_NAME_VERSION})

# Retrieve current revision from Git working tree.
git_wt_info(SOURCE_DIR "${CMAKE_SOURCE_DIR}"
            PREFIX TEMPLATE_NAME)

if(DEFINED TEMPLATE_NAME_GIT_WT_HASH)
    if(TEMPLATE_NAME_GIT_WT_TAG_REVISION GREATER 0)
        set(TEMPLATE_NAME_VERSION_REVISION ${TEMPLATE_NAME_GIT_WT_TAG_REVISION})
        string(REPLACE "-" "" _date ${TEMPLATE_NAME_GIT_WT_AUTHOR_DATE})
        set(TEMPLATE_NAME_VERSION_SOURCE
            "${_date}.${TEMPLATE_NAME_GIT_WT_DATE_REVISION}+git${TEMPLATE_NAME_GIT_WT_HASH_SHORT}")
    endif()

    if(TEMPLATE_NAME_GIT_WT_DIRTY)
        set(TEMPLATE_NAME_VERSION_DIRTY "dirty")
    endif()
endif()

if(DEFINED TEMPLATE_NAME_VERSION_SOURCE)
    if(NOT "${TEMPLATE_NAME_GIT_WT_TAG}" STREQUAL "v${TEMPLATE_NAME_VERSION_SHORT}")
        set(TEMPLATE_NAME_VERSION
            "${TEMPLATE_NAME_VERSION_SHORT}+${TEMPLATE_NAME_VERSION_SOURCE}")
    else()
        set(TEMPLATE_NAME_VERSION
           "${TEMPLATE_NAME_VERSION_SHORT}+${TEMPLATE_NAME_VERSION_REVISION}-${TEMPLATE_NAME_VERSION_SOURCE}")
    endif()
elseif(NOT "${TEMPLATE_NAME_GIT_WT_TAG}" STREQUAL "v${TEMPLATE_NAME_VERSION_SHORT}")
    set(TEMPLATE_NAME_VERSION "${TEMPLATE_NAME_VERSION_SHORT}~dev")
else()
    set(TEMPLATE_NAME_VERSION "${TEMPLATE_NAME_VERSION_SHORT}")
endif()

if(DEFINED TEMPLATE_NAME_VERSION_DIRTY)
    set(TEMPLATE_NAME_VERSION "${TEMPLATE_NAME_VERSION}+${TEMPLATE_NAME_VERSION_DIRTY}")
endif()

# Print version.
message(STATUS "TEMPLATE_NAME version: ${TEMPLATE_NAME_VERSION_SHORT} (${TEMPLATE_NAME_VERSION})")

