cmake_minimum_required(VERSION 3.15...4.1)
project(STM32G4_FW VERSION 1.0 LANGUAGES C CXX ASM)

add_executable(STM32G4_FW test.cpp)

# 新增：指定链接器脚本
target_link_options(STM32G4_FW PRIVATE 
    "-T${CMAKE_CURRENT_SOURCE_DIR}/STM32G474VE.ld"
    "-Wl,-Map=${CMAKE_CURRENT_BINARY_DIR}/STM32G4_FW.map" # 顺手生成一个 map 文件，方便以后分析内存
)