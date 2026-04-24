# 交叉编译
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)
# 跳过链接测试
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
# 链接为elf后缀
set(CMAKE_EXECUTABLE_SUFFIX_ASM ".elf")
set(CMAKE_EXECUTABLE_SUFFIX_C   ".elf")
set(CMAKE_EXECUTABLE_SUFFIX_CXX ".elf")

# set(toolchain_path "C:/ATfE-22.1.0-Windows-x86_64")
# set(CMAKE_ASM_COMPILER "${toolchain_path}/bin/clang.exe")
# set(CMAKE_C_COMPILER   "${toolchain_path}/bin/clang.exe")
# set(CMAKE_CXX_COMPILER "${toolchain_path}/bin/clang++.exe")
set(toolchain_path "/opt/ATfE-22.1.0-Linux-x86_64")
set(CMAKE_ASM_COMPILER "${toolchain_path}/bin/clang")
set(CMAKE_C_COMPILER   "${toolchain_path}/bin/clang")
set(CMAKE_CXX_COMPILER "${toolchain_path}/bin/clang++")
unset(toolchain_path)

set(target_flags "")
string(APPEND target_flags " --target=arm-none-eabi")
string(APPEND target_flags " -mcpu=cortex-m4")
string(APPEND target_flags " -mfloat-abi=hard")
string(APPEND target_flags " -mfpu=fpv4-sp-d16")
set(CMAKE_C_FLAGS   "${target_flags}" CACHE INTERNAL "")
set(CMAKE_CXX_FLAGS "${target_flags}" CACHE INTERNAL "")
set(CMAKE_ASM_FLAGS "${target_flags}" CACHE INTERNAL "")
unset(target_flags)

# compile_commands.json
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)