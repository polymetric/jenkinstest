cmake_minimum_required(VERSION 3.10)
project(gaming VERSION 0.1.0)

set(
    SOURCES_LIST
    main.c
)

if (NOT DEFINED PROJECT_NAME)
    set(EXECUTABLE_NAME ${PROJECT_NAME})
endif()

if (WIN32 AND NOT CMAKE_BUILD_TYPE MATCHES Debug)
    add_executable(
        ${EXECUTABLE_NAME}
        WIN32
        ${SOURCES_LIST}
    )
else()
    add_executable(
        ${EXECUTABLE_NAME}
        ${SOURCES_LIST}
    )
endif()

