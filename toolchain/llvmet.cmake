# 交叉编译
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)
# 跳过链接测试
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# 编译器
block(PROPAGATE CMAKE_ASM_COMPILER CMAKE_C_COMPILER CMAKE_CXX_COMPILER)
  set(toolchain_path "C:/ATfE-22.1.0-Windows-x86_64")
  set(CMAKE_ASM_COMPILER "${toolchain_path}/bin/clang.exe")
  set(CMAKE_C_COMPILER   "${toolchain_path}/bin/clang.exe")
  set(CMAKE_CXX_COMPILER "${toolchain_path}/bin/clang++.exe")
  
  set(target_flags "")
  string(APPEND target_flags " --target=arm-none-eabi")
  string(APPEND target_flags " -mcpu=cortex-m4")
  string(APPEND target_flags " -mfloat-abi=hard")
  string(APPEND target_flags " -mfpu=fpv4-sp-d16")
  set(CMAKE_C_FLAGS   "${target_flags}" CACHE INTERNAL "")
  set(CMAKE_CXX_FLAGS "${target_flags}" CACHE INTERNAL "")
  set(CMAKE_ASM_FLAGS "${target_flags}" CACHE INTERNAL "")
endblock()

# compile_commands.json
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)