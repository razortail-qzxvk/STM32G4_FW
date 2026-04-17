

# 告知 CMake 这是交叉编译
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

# 强制指定编译器路径（指向你解压出来的那个 ATfE 路径）
set(TOOLCHAIN_PATH "C:/ATfE-22.1.0-Windows-x86_64") # 换成你的实际路径，注意用正斜杠
set(CMAKE_C_COMPILER "${TOOLCHAIN_PATH}/bin/clang.exe")
set(CMAKE_CXX_COMPILER "${TOOLCHAIN_PATH}/bin/clang++.exe")
set(CMAKE_ASM_COMPILER "${TOOLCHAIN_PATH}/bin/clang.exe")

# 关键：告诉 LLVM 你的目标是 STM32G4 (Cortex-M4)
set(TARGET_FLAGS "--target=arm-none-eabi -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16")

set(CMAKE_C_FLAGS "${TARGET_FLAGS}" CACHE INTERNAL "")
set(CMAKE_CXX_FLAGS "${TARGET_FLAGS}" CACHE INTERNAL "")
set(CMAKE_ASM_FLAGS "${TARGET_FLAGS}" CACHE INTERNAL "")