function(enable_clang_format_fix TARGET)
    file(GLOB_RECURSE CLANG_FORMAT_SRC CONFIGURE_DEPENDS
        "${CMAKE_SOURCE_DIR}/src/*.h"
        "${CMAKE_SOURCE_DIR}/src/*.cpp"
        "${CMAKE_SOURCE_DIR}/src/*.hpp"
        "${CMAKE_SOURCE_DIR}/tests/*.h"
        "${CMAKE_SOURCE_DIR}/tests/*.cpp"
        "${CMAKE_SOURCE_DIR}/tests/*.hpp"
    )

    if(NOT CLANG_FORMAT_SRC)
        message(WARNING "clang-format: no source files found")
        return()
    endif()

    # Исправление формата in-place
    SET(CLANG_FORMAT_FIX clang-format-fix)
    if(NOT TARGET ${CLANG_FORMAT_FIX})
        add_custom_target(${CLANG_FORMAT_FIX}
            COMMAND ${CLANG_FORMAT_PATH} -style=file -i ${CLANG_FORMAT_SRC}
            WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
            COMMENT "Formatting ${TARGET} with ${CLANG_FORMAT_PATH}"
            VERBATIM
        )
    endif()

    add_dependencies(${TARGET} ${CLANG_FORMAT_FIX})

endfunction()
