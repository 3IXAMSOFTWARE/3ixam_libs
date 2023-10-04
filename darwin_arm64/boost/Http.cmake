# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# This is Http modules linkage script.
# Modules:
# * Boost.ASIO
# * Boost.Beast
# * OpenSSL: SSL, LibCrypto
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if (NOT DEFINED LINK_HTTP_DEFINED)

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Boost ASIO & Beast Headers
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if (NOT DEFINED LIBDIR)
        message(FATAL_ERROR "${PROJECT_NAME} - LIBDIR is not defined")
    endif (NOT DEFINED LIBDIR)

    if (NOT DEFINED BOOST_INCLUDE_DIR)
        set(BOOST_INCLUDE_DIR "${LIBDIR}/boost/include")
    endif (NOT DEFINED BOOST_INCLUDE_DIR)

    if (NOT DEFINED BOOST_INCLUDE_DIR OR NOT EXISTS "${BOOST_INCLUDE_DIR}/boost/asio.hpp")
        message(FATAL_ERROR "${PROJECT_NAME} - Boost.ASIO include dir not defined")
    endif (NOT DEFINED BOOST_INCLUDE_DIR OR NOT EXISTS "${BOOST_INCLUDE_DIR}/boost/asio.hpp")

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # OpenSSL & libCrypto
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    set(OPEN_SSL_CMAKE_PATH "${LIBDIR}/openssl/OpenSSL.cmake")
    if (NOT EXISTS ${OPEN_SSL_CMAKE_PATH})
        message(FATAL_ERROR "${PROJECT_NAME} - OpenSSL.cmake not found at: ${OPEN_SSL_CMAKE_PATH}")
    endif (NOT EXISTS ${OPEN_SSL_CMAKE_PATH})
    
    if (NOT OPEN_SSL_FOUND)
        set(SKIP_IMPORTING_LIB_CRYPTO OFF)
        include(${OPEN_SSL_CMAKE_PATH})
    endif (NOT OPEN_SSL_FOUND)

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Clog
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if (NOT SKIP_CLOG)
        set(CLOG_INCLUDE_DIR "${CMAKE_SOURCE_DIR}/intern/clog")

        if (NOT CLOG_INCLUDE_DIR OR NOT EXISTS ${CLOG_INCLUDE_DIR})
            message(FATAL_ERROR "${PROJECT_NAME} - CLog include dir is invalid: ${CLOG_INCLUDE_DIR}")
        endif (NOT CLOG_INCLUDE_DIR OR NOT EXISTS ${CLOG_INCLUDE_DIR})
    endif (NOT SKIP_CLOG)

    function(LinkHttp lib)
        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        # Boost ASIO & Beast Headers
        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        target_include_directories(${lib} PRIVATE ${BOOST_INCLUDE_DIR})

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        # OpenSSL & libCrypto
        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        
        if (NOT SKIP_SSL)
            target_link_libraries(${lib} libssl libcryptossl)
            target_include_directories(${lib} PRIVATE "${LIBDIR}/openssl/include")
        endif (NOT SKIP_SSL)

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        # Clog
        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        if (NOT SKIP_CLOG)
            target_link_libraries(${lib} bf_intern_clog)
            target_include_directories(${lib} PRIVATE ${CLOG_INCLUDE_DIR})
        endif (NOT SKIP_CLOG)

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    endfunction()

endif (NOT DEFINED LINK_HTTP_DEFINED)

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
