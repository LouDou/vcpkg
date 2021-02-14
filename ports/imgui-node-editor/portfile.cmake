vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO thedmd/imgui-node-editor
    REF c0bcf5e8
    SHA512 8b14db21488737924ee05c48a3604cebd8eb2d073763df255995d33c81b63d81e00c277a1d359d33fc0206c52bbc44c4dfce1e5ae996b2bab04b7395f2dfdf9f
    HEAD_REF develop
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/imgui-node-editor-config.cmake.in DESTINATION ${SOURCE_PATH})
file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS_DEBUG
        -DIMGUI_NODE_EDITOR_SKIP_HEADERS=ON
)

vcpkg_install_cmake()

vcpkg_copy_pdbs()

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
