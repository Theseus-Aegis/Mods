set(TAC_NAME "tac_apollo_client")

file(GLOB SOURCES *.h *.hpp *.c *.cpp)

add_library(${TAC_NAME} MODULE ${SOURCES})
set_target_properties(${TAC_NAME} PROPERTIES FOLDER Apollo)


# Copy and rename
if(USE_64BIT_BUILD)
    set(FINAL_DLL_NAME ${TAC_NAME}_x64.dll)
else()
    set(FINAL_DLL_NAME ${TAC_NAME}.dll)
endif()

add_custom_command(TARGET ${TAC_NAME} POST_BUILD
    # Copy DLL to plugins
    COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:${TAC_NAME}> ${PROJECT_SOURCE_DIR}/../${FINAL_DLL_NAME}
    # Copy PDB to symbols
    COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE_DIR:${TAC_NAME}>/${TAC_NAME}.pdb ${PROJECT_SOURCE_DIR}/../symbols/${TAC_ARCH}/${TAC_NAME}.pdb
)
