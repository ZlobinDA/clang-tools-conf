function(enable_clang_tidy TARGET)
    set(CLANG_TIDY_COMMAND
        ${CLANG_TIDY_PATH}
        "-config-file=${CMAKE_SOURCE_DIR}/.clang-tidy"
    )

    set_target_properties(${TARGET} PROPERTIES
        CXX_CLANG_TIDY "${CLANG_TIDY_COMMAND}"
    )
endfunction()

