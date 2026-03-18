function(enable_clang_format_check TARGET)
    file(GLOB_RECURSE CLANG_FORMAT_SRC CONFIGURE_DEPENDS
        "${CMAKE_SOURCE_DIR}/src/include"
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

    # Проверка форматирования
    SET(CLANG_FORMAT_CHECK clang-format-check)
    if(NOT TARGET ${CLANG_FORMAT_CHECK})
        find_program(RUN_CLANG_FORMAT_PATH NAMES run-clang-format.py run-clang-format)
        if(NOT RUN_CLANG_FORMAT_PATH)
            message(WARNING "run-clang-format not found, target ${CLANG_FORMAT_CHECK} unavailable")
            return()
        else()
            add_custom_target(${CLANG_FORMAT_CHECK}
                COMMAND ${RUN_CLANG_FORMAT_PATH}
                        --clang-format-executable=${CLANG_FORMAT_PATH}
                        --style=file
                        ${CLANG_FORMAT_SRC}
                WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
                COMMENT "Checking format ${TARGET} with ${CLANG_FORMAT_PATH}"
                VERBATIM
            )
            add_dependencies(${TARGET} ${CLANG_FORMAT_CHECK})
        endif()
    endif()

    add_dependencies(${TARGET} ${CLANG_FORMAT_CHECK})

endfunction()
