include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO uWebSockets/uWebSockets
    REF v0.15a5
    SHA512 1392311abacdba83cb3b4398b854e3f6815132d9cc0a6d66596760291c4a63e31b65651f4ee95f4d0ceeeaf9f582c99c9ab8bf7f7bdc7f8fe37b32ff1085ed1e
    HEAD_REF master
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS_DEBUG
        -DINSTALL_HEADERS=OFF
)

vcpkg_install_cmake()

file(COPY ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/uwebsockets)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/uwebsockets/LICENSE ${CURRENT_PACKAGES_DIR}/share/uwebsockets/copyright)

vcpkg_copy_pdbs()
