cmake_minimum_required(VERSION 3.15...4.1)
get_filename_component(dir_name ${CMAKE_CURRENT_SOURCE_DIR} NAME)
project(${dir_name})

add_executable(${PROJECT_NAME})
target_sources(${PROJECT_NAME}
  PRIVATE
    core/test.cpp
)

# 新增：指定链接器脚本
target_link_options(${PROJECT_NAME} PRIVATE 
    "-T${CMAKE_CURRENT_SOURCE_DIR}/STM32G474VE.ld"
    "-Wl,-Map=${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.map" # 顺手生成一个 map 文件，方便以后分析内存
)