if(USE_64BIT_BUILD)
    set(TAC_NAME "tac_apollo_client_x64")
else()
    set(TAC_NAME "tac_apollo_client")
endif()
tac_set_linker_options()

file(GLOB SOURCES *.h *.hpp *.c *.cpp)
add_library(${TAC_NAME} SHARED ${SOURCES} ${GLOBAL_SOURCES})
target_link_libraries(${TAC_NAME} tac_common)
set_target_properties(${TAC_NAME} PROPERTIES PREFIX "")
set_target_properties(${TAC_NAME} PROPERTIES FOLDER Apollo)

# Copy
add_custom_command(TARGET ${TAC_NAME} POST_BUILD
    # Copy DLL to plugins
    COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:${TAC_NAME}> ${PROJECT_SOURCE_DIR}/../$<TARGET_FILE_NAME:${TAC_NAME}>
)
if(MSVC)
    add_custom_command(TARGET ${TAC_NAME} POST_BUILD
        # Copy PDB to symbols
        COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE_DIR:${TAC_NAME}>/${TAC_NAME}.pdb ${PROJECT_SOURCE_DIR}/../symbols/${TAC_ARCH}/${TAC_NAME}.pdb
    )
endif()
