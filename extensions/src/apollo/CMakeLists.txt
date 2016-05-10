set(TAC_EXTENSION_NAME "tac_apollo")

file(GLOB SOURCES *.h *.hpp *.c *.cpp)

add_library( ${TAC_EXTENSION_NAME} SHARED ${SOURCES})

set_target_properties(${TAC_EXTENSION_NAME} PROPERTIES PREFIX "")
set_target_properties(${TAC_EXTENSION_NAME} PROPERTIES FOLDER Extensions)

if(CMAKE_COMPILER_IS_GNUCXX)
	set_target_properties(${TAC_EXTENSION_NAME} PROPERTIES LINK_SEARCH_START_STATIC 1)
	set_target_properties(${TAC_EXTENSION_NAME} PROPERTIES LINK_SEARCH_END_STATIC 1)
endif()
