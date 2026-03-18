# Описание
Набор конфигурационных файлов для утилит `clang-tidy` и `clang-format`.

# clang-format
Для работы цели `clang-format-check` необходимо установить скрипт `run-clang-format.py`
Официальный репозиторий скрипта https://github.com/Sarcasm/run-clang-format

Команды для установки:
```bash
curl -O https://raw.githubusercontent.com/Sarcasm/run-clang-format/master/run-clang-format.py
sudo cp run-clang-format.py /usr/local/bin/run-clang-format
sudo chmod +x /usr/local/bin/run-clang-format
```

# Пример использования

В файл CMakeLists.txt добавить:
```bash
include(FetchContent)
set(FETCHCONTENT_UPDATES_DISCONNECTED ON)

FetchContent_Declare(clang-tools
    GIT_REPOSITORY https://github.com/ZlobinDA/clang-tools-conf.git
    GIT_TAG main
    GIT_SHALLOW TRUE
    GIT_PROGRESS TRUE
    USES_TERMINAL_DOWNLOAD TRUE
)
FetchContent_MakeAvailable(clang-tools)

find_program(CLANG_FORMAT_PATH NAMES clang-format-19 clang-format)
if(NOT CLANG_FORMAT_PATH)
    message(WARNING "clang-format not found")
else()
    enable_clang_format_fix(${ИМЯ_ПРОЕКТА})
    # или
    # enable_clang_format_check(${ИМЯ_ПРОЕКТА})
endif()
```
