# clang tooling module

find_program(CLANG_FORMAT NAMES clang-format clang-format-6.0)
if (CLANG_FORMAT)
  add_custom_target(
    clang-format
      COMMAND ${CLANG_FORMAT}
      -i
      ${TEST_SOURCE_FILES} ${APP_SOURCE_FILES} ${PROJECT_SOURCE_FILES}
  )
endif ()
