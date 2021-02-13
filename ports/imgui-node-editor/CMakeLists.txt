cmake_minimum_required(VERSION 3.8)

project(imgui_node_editor VERSION 0.9.1 LANGUAGES CXX)

set(CMAKE_DEBUG_POSTFIX d)

set(IMGUI_NODE_EDITOR_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})

#include(${CMAKE_CURRENT_SOURCE_DIR}/misc/cmake-modules/Findimgui_node_editor.cmake)
#################################

set(_imgui_node_editor_Sources
    ${IMGUI_NODE_EDITOR_ROOT_DIR}/crude_json.cpp
    ${IMGUI_NODE_EDITOR_ROOT_DIR}/crude_json.h
    ${IMGUI_NODE_EDITOR_ROOT_DIR}/imgui_bezier_math.h
    ${IMGUI_NODE_EDITOR_ROOT_DIR}/imgui_bezier_math.inl
    ${IMGUI_NODE_EDITOR_ROOT_DIR}/imgui_canvas.cpp
    ${IMGUI_NODE_EDITOR_ROOT_DIR}/imgui_canvas.cpp
    ${IMGUI_NODE_EDITOR_ROOT_DIR}/imgui_canvas.h
    ${IMGUI_NODE_EDITOR_ROOT_DIR}/imgui_canvas.h
    ${IMGUI_NODE_EDITOR_ROOT_DIR}/imgui_extra_math.h
    ${IMGUI_NODE_EDITOR_ROOT_DIR}/imgui_extra_math.inl
    ${IMGUI_NODE_EDITOR_ROOT_DIR}/imgui_node_editor_api.cpp
    ${IMGUI_NODE_EDITOR_ROOT_DIR}/imgui_node_editor_internal.h
    ${IMGUI_NODE_EDITOR_ROOT_DIR}/imgui_node_editor_internal.inl
    ${IMGUI_NODE_EDITOR_ROOT_DIR}/imgui_node_editor.cpp
    ${IMGUI_NODE_EDITOR_ROOT_DIR}/imgui_node_editor.h
    ${IMGUI_NODE_EDITOR_ROOT_DIR}/misc/imgui_node_editor.natvis
)

add_library(
    ${PROJECT_NAME}
    STATIC
        ${_imgui_node_editor_Sources}
)

target_include_directories(
    ${PROJECT_NAME}
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:include>
)

find_package(imgui CONFIG REQUIRED)
target_link_libraries(${PROJECT_NAME} PRIVATE imgui::imgui)

source_group(TREE ${IMGUI_NODE_EDITOR_ROOT_DIR} FILES ${_imgui_node_editor_Sources})

include(${CMAKE_ROOT}/Modules/FindPackageHandleStandardArgs.cmake)

find_package_handle_standard_args(
    ${PROJECT_NAME}
    REQUIRED_VARS
        IMGUI_NODE_EDITOR_ROOT_DIR
)

##################################

install(
  TARGETS ${PROJECT_NAME}
  EXPORT ${PROJECT_NAME}_target
  LIBRARY DESTINATION lib
)

if(NOT IMGUI_NODE_EDITOR_SKIP_HEADERS)
  install(
    FILES
      ${CMAKE_CURRENT_SOURCE_DIR}/crude_json.h
      ${CMAKE_CURRENT_SOURCE_DIR}/imgui_bezier_math.h
      ${CMAKE_CURRENT_SOURCE_DIR}/imgui_canvas.h
      ${CMAKE_CURRENT_SOURCE_DIR}/imgui_extra_math.h
      ${CMAKE_CURRENT_SOURCE_DIR}/imgui_node_editor.h
      ${CMAKE_CURRENT_SOURCE_DIR}/imgui_node_editor_internal.h
    DESTINATION include
  )
endif()

