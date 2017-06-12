set(TAC_NAME "tac_common")
tac_set_linker_options()

file(GLOB SOURCES *.h *.hpp *.c *.cc *.cpp)
add_library(${TAC_NAME} STATIC ${SOURCES} ${GLOBAL_SOURCES})
set_target_properties(${TAC_NAME} PROPERTIES PREFIX "")
set_target_properties(${TAC_NAME} PROPERTIES FOLDER Shared)
