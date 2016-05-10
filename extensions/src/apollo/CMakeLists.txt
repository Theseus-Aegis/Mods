get_filename_component(TAC_EXTENSION_DIR ${CMAKE_CURRENT_SOURCE_DIR} NAME)
set(TAC_EXTENSION_NAME "${PROJECT_NAME}_${TAC_EXTENSION_DIR}")

file(GLOB SOURCES *.h *.hpp *.c *.cpp)

add_library(${TAC_EXTENSION_NAME} SHARED ${SOURCES} ${GLOBAL_SOURCES})

target_link_libraries(${TAC_EXTENSION_NAME} ${PROJECT_SOURCE_DIR}/lib/intercept_client.lib)

include_directories(${PROJECT_SOURCE_DIR}/include/intercept)
include_directories(${PROJECT_SOURCE_DIR}/include/intercept/client/sqf)

set_target_properties(${TAC_EXTENSION_NAME} PROPERTIES PREFIX "")
set_target_properties(${TAC_EXTENSION_NAME} PROPERTIES FOLDER Extensions)

if(CMAKE_COMPILER_IS_GNUCXX)
	set_target_properties(${TAC_EXTENSION_NAME} PROPERTIES LINK_SEARCH_START_STATIC 1)
	set_target_properties(${TAC_EXTENSION_NAME} PROPERTIES LINK_SEARCH_END_STATIC 1)
endif()
