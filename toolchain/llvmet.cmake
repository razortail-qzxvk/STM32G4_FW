# 交叉编译
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)
# 跳过链接测试
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
# 链接为elf后缀
set(CMAKE_EXECUTABLE_SUFFIX_ASM .elf)
set(CMAKE_EXECUTABLE_SUFFIX_C   .elf)
set(CMAKE_EXECUTABLE_SUFFIX_CXX .elf)

# 编译器
set(toolchain_path "/opt/ATfE-22.1.0-Linux-x86_64")
set(CMAKE_C_COMPILER "${toolchain_path}/bin/clang")
set(CMAKE_FIND_ROOT_PATH toolchain_path)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_ASM_COMPILER_TARGET arm-none-eabi)
set(CMAKE_C_COMPILER_TARGET   arm-none-eabi)
set(CMAKE_CXX_COMPILER_TARGET arm-none-eabi)
unset(toolchain_path)
# 全局编译选项
set(target_flags " -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16")
set(CMAKE_C_FLAGS_INIT   "${target_flags}")
set(CMAKE_CXX_FLAGS_INIT "${target_flags} -stdlib=libc++")
set(CMAKE_ASM_FLAGS_INIT "${target_flags}")
unset(target_flags)

# compile_commands.json
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)