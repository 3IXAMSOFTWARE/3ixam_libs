# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

if (NOT DEFINED OPEN_SSL_FOUND)

    if (CMAKE_BUILD_TYPE STREQUAL "Debug")
        set(OPEN_SSL_BUILD_TYPE "debug")
    else (CMAKE_BUILD_TYPE STREQUAL "Debug")
        set(OPEN_SSL_BUILD_TYPE "release")
    endif (CMAKE_BUILD_TYPE STREQUAL "Debug")

    # Common for OpenSSL interface-headers
    set(OPEN_SSL_INTERFACE_DIR "${CMAKE_CURRENT_LIST_DIR}/include/openssl")
    if (NOT EXISTS "${OPEN_SSL_INTERFACE_DIR}/conf.h")
        message(FATAL_ERROR "${PROJECT_NAME} - invalid OpenSSL include dir: ${OPEN_SSL_INTERFACE_DIR}")
    endif (NOT EXISTS "${OPEN_SSL_INTERFACE_DIR}/conf.h")

    # OpenSSL:Crypto
    set(LIB_CRYPTO_PATH "${CMAKE_CURRENT_LIST_DIR}/lib/${OPEN_SSL_BUILD_TYPE}/libcrypto.a")
    if (NOT EXISTS ${LIB_CRYPTO_PATH})
        message( FATAL_ERROR "${PROJECT_NAME} - libcrypto not found at ${LIB_CRYPTO_PATH}" )
    endif (NOT EXISTS ${LIB_CRYPTO_PATH})

    if (NOT SKIP_IMPORTING_LIB_CRYPTO)
        add_library(libcryptossl STATIC IMPORTED)
        set_target_properties(libcryptossl PROPERTIES
            IMPORTED_LOCATION ${LIB_CRYPTO_PATH}
            INTERFACE_INCLUDE_DIRECTORIES ${OPEN_SSL_INTERFACE_DIR}
        )
    endif (NOT SKIP_IMPORTING_LIB_CRYPTO)

    # OpenSSL:SSL
    set(OPEN_SSL_LIB_PATH "${CMAKE_CURRENT_LIST_DIR}/lib/${OPEN_SSL_BUILD_TYPE}/libssl.a")
    if (NOT EXISTS ${OPEN_SSL_LIB_PATH})
        message( FATAL_ERROR "${PROJECT_NAME} - libssl not found at ${OPEN_SSL_LIB_PATH}" )
    endif (NOT EXISTS ${OPEN_SSL_LIB_PATH})

    add_library(libssl STATIC IMPORTED)
    set_target_properties(libssl PROPERTIES
        IMPORTED_LOCATION ${OPEN_SSL_LIB_PATH}
        INTERFACE_INCLUDE_DIRECTORIES ${OPEN_SSL_INTERFACE_DIR}
    )

    #if (NOT SKIP_IMPORTING_LIB_CRYPTO)
    #    add_library(libcrypto STATIC IMPORTED)
    #    set_target_properties(libcrypto PROPERTIES
    #        IMPORTED_LOCATION ${OPEN_SSL_LIB_PATH}
    #        INTERFACE_INCLUDE_DIRECTORIES ${OPEN_SSL_INTERFACE_DIR}
    #    )
    #endif (NOT SKIP_IMPORTING_LIB_CRYPTO)

    set(OPEN_SSL_FOUND ${OPEN_SSL_LIB_PATH})
endif (NOT DEFINED OPEN_SSL_FOUND)

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
