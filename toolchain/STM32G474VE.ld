/* 声明入口函数（通常在汇编启动文件里，如果没有，crt0 会默认接管） */
ENTRY(_start)

/* 定义 STM32G474VE 的物理内存布局 */
MEMORY
{
  FLASH (rx)      : ORIGIN = 0x08000000, LENGTH = 512K
  RAM (xrw)       : ORIGIN = 0x20000000, LENGTH = 128K
}

/* 定义最高的栈顶地址 (RAM 的末尾) */
__stack = ORIGIN(RAM) + LENGTH(RAM);

SECTIONS
{
  /* 代码段，放入 Flash */
  .text :
  {
    KEEP(*(.isr_vector)) /* 中断向量表（如果你有的话） */
    *(.text)
    *(.text.*)
    *(.rodata)
    *(.rodata.*)
    . = ALIGN(4);
  } > FLASH

  /* 记录数据段在 Flash 中的起始位置，供 crt0 搬运使用 */
  __data_source = LOADADDR(.data);

  /* 数据段，运行在 RAM，存储在 Flash */
  .data :
  {
    . = ALIGN(4);
    __data_start = .;
    *(.data)
    *(.data.*)
    . = ALIGN(4);
    __data_size = . - __data_start; /* 计算数据段大小 */
  } > RAM AT > FLASH

  /* BSS 段（未初始化变量），运行在 RAM，由 crt0 清零 */
  .bss :
  {
    . = ALIGN(4);
    __bss_start = .;
    *(.bss)
    *(.bss.*)
    *(COMMON)
    . = ALIGN(4);
    __bss_size = . - __bss_start; /* 计算 BSS 段大小 */
  } > RAM

  /* 适配 TLS (Thread Local Storage) 等高级 C++ 特性 */
  __tls_base = .;
  __arm32_tls_tcb_offset = 0;
}