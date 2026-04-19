cmake_minimum_required(VERSION 3.28...4.1)
get_filename_component(dir_name ${CMAKE_CURRENT_SOURCE_DIR} NAME)
project(${dir_name})
unset(dir_name)

add_executable(${PROJECT_NAME})

# 源文件
target_sources(${PROJECT_NAME}
  PRIVATE
    source/core/test.cpp
)

# Modules
target_sources(${PROJECT_NAME}
  PUBLIC
    FILE_SET CXX_MODULES FILES
    source/core/test.cppm
)

# 头文件包含路径
target_include_directories(${PROJECT_NAME}
  PRIVATE
    source/core
    source/hal/inc
)

# 全局宏定义
target_compile_definitions(${PROJECT_NAME} PRIVATE
    STM32G474xx
    USE_FULL_LL_DRIVER
)

# 编译选项
target_compile_features(${PROJECT_NAME}
  PRIVATE
    cxx_std_26
)
target_compile_options(${PROJECT_NAME}
  PRIVATE
    -O3
    -Wall -Wextra -Wpedantic
    -fno-exceptions -fno-rtti
)

# 链接脚本
target_link_options(${PROJECT_NAME}
  PRIVATE
    "-T${CMAKE_CURRENT_SOURCE_DIR}/toolchain/STM32G474VE.ld"
)

# 编译事件
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND llvm-objcopy -O ihex   $<TARGET_FILE:${PROJECT_NAME}> ${PROJECT_NAME}.hex # hex
    COMMAND llvm-objcopy -O binary $<TARGET_FILE:${PROJECT_NAME}> ${PROJECT_NAME}.bin # bin
    COMMAND llvm-size $<TARGET_FILE:${PROJECT_NAME}> # size
)