# 交叉编译
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)
# 跳过链接测试
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# 编译器
set(TOOLCHAIN_PATH "C:/ATfE-22.1.0-Windows-x86_64")
set(CMAKE_C_COMPILER "${TOOLCHAIN_PATH}/bin/clang.exe")
set(CMAKE_CXX_COMPILER "${TOOLCHAIN_PATH}/bin/clang++.exe")
set(CMAKE_ASM_COMPILER "${TOOLCHAIN_PATH}/bin/clang.exe")

# 目标
# Cortex-M4
set(TARGET_FLAGS "--target=arm-none-eabi -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16")

set(CMAKE_C_FLAGS "${TARGET_FLAGS}" CACHE INTERNAL "")
set(CMAKE_CXX_FLAGS "${TARGET_FLAGS}" CACHE INTERNAL "")
set(CMAKE_ASM_FLAGS "${TARGET_FLAGS}" CACHE INTERNAL "")