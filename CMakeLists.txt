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
    $<$<CONFIG:Debug>:-O0 -g3>
    $<$<CONFIG:Release>:-Os -g0>
    # ST推荐 C
    -Wall
    -fdata-sections -ffunction-sections -fstack-usage
    # ST推荐 C 但默认不开启的选项，似乎是为了CubeIDE的静态分析工具准备的
    # -fcyclomatic-complexity
    # ST推荐 C++
    -fno-rtti -fno-exceptions -fno-threadsafe-statics
    # User
    -Wextra -Wpedantic
)

# 链接脚本
target_link_options(${PROJECT_NAME}
  PRIVATE
    # 指定链接脚本
    "-T${CMAKE_CURRENT_SOURCE_DIR}/toolchain/STM32G474VE.ld"
    # 生成 Map 文件
    "-Wl,-Map=${PROJECT_NAME}.map"
    # ST推荐 链接选项
    "--specs=nano.specs"
    "-Wl,--gc-sections"
    "-Wl,--print-memory-usage"
)

# 编译事件
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND llvm-objcopy -O ihex   $<TARGET_FILE:${PROJECT_NAME}> ${PROJECT_NAME}.hex # hex
    COMMAND llvm-objcopy -O binary $<TARGET_FILE:${PROJECT_NAME}> ${PROJECT_NAME}.bin # bin
    COMMAND llvm-size $<TARGET_FILE:${PROJECT_NAME}> # size
)

# 全局链接选项
# add_link_options(
#     "-T${CMAKE_SOURCE_DIR}/${STM32_LINKER_SCRIPT}"
#     "--specs=nano.specs"
#     "-Wl,--gc-sections"
# )

# 汇编文件编译选项
# target_compile_options(${PROJECT_NAME}
#   PRIVATE
#     -Wall
#     -fdata-sections -ffunction-sections -fstack-usage
#     -x assembler-with-cpp -MMD -MP
# )