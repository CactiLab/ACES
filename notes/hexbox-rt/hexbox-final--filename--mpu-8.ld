/*
*****************************************************************************
**

**  File        : LinkerScript.ld
**
**  Abstract    : Linker script for STM32F469NIHx Device with
**                2048KByte FLASH, 320KByte RAM
**
**                Set heap size, stack size and stack location according
**                to application requirements.
**
**                Set memory bank area and size if external memory is used.
**
**  Target      : STMicroelectronics STM32
**
**
**  Distribution: The file is distributed as is, without any warranty
**                of any kind.
**
**  (c)Copyright Ac6.
**  You may use this file as-is or modify it according to the needs of your
**  project. Distribution of this file (unmodified or modified) is not
**  permitted. Ac6 permit registered System Workbench for MCU users the
**  rights to distribute the assembled, compiled & linked contents of this
**  file as part of an application binary file, provided that it is built
**  using the System Workbench for MCU toolchain.
**
*****************************************************************************
*/

/* Entry Point */
ENTRY(Reset_Handler)

/* Highest address of the user mode stack */
/* _estack = 0x20050000;    /* end of RAM  */
/* Generate a link error if heap and stack don't fit into RAM */
_Min_Heap_Size = 0x200;;      /* required amount of heap  */
_Min_Stack_Size = 0x1000;; /* required amount of stack */

/* Specify the memory areas */
MEMORY
{
FLASH (rx)      : ORIGIN = 0x8000000, LENGTH = 2048K
RAM (xrw)      : ORIGIN = 0x20000000, LENGTH = 320K
CCMRAM (rw)      : ORIGIN = 0x10000000, LENGTH = 64K
}

/* Define output sections */
SECTIONS
{
  /* The startup code goes first into FLASH */
  .isr_vector :
  {
    . = ALIGN(8);
    KEEP(*(.isr_vector)) /* Startup code */
    . = ALIGN(8);
  } >FLASH

  /* The program code and other data goes into FLASH */
  .text :
  {
    . = ALIGN(8);
    *(.text)           /* .text sections (code) */
    *(.text*)          /* .text* sections (code) */
    *(.glue_7)         /* glue arm to thumb code */
    *(.glue_7t)        /* glue thumb to arm code */
    *(.eh_frame)

    KEEP (*(.init))
    KEEP (*(.fini))

    . = ALIGN(8);
    _etext = .;        /* define a global symbols at end of code */
  } >FLASH

  /* Constant data goes into FLASH */
  .rodata :
  {
    . = ALIGN(8);
    *(.rodata)         /* .rodata sections (constants, strings, etc.) */
    *(.rodata*)        /* .rodata* sections (constants, strings, etc.) */
    . = ALIGN(8);
  } >FLASH

  .ARM.extab   : { *(.ARM.extab* .gnu.linkonce.armextab.*) } >FLASH
  .ARM : {
    __exidx_start = .;
    *(.ARM.exidx*)
    __exidx_end = .;
  } >FLASH

  .preinit_array     :
  {
    PROVIDE_HIDDEN (__preinit_array_start = .);
    KEEP (*(.preinit_array*))
    PROVIDE_HIDDEN (__preinit_array_end = .);
  } >FLASH
  .init_array :
  {
    PROVIDE_HIDDEN (__init_array_start = .);
    KEEP (*(SORT(.init_array.*)))
    KEEP (*(.init_array*))
    PROVIDE_HIDDEN (__init_array_end = .);
  } >FLASH
  .fini_array :
  {
    PROVIDE_HIDDEN (__fini_array_start = .);
    KEEP (*(SORT(.fini_array.*)))
    KEEP (*(.fini_array*))
    PROVIDE_HIDDEN (__fini_array_end = .);
  } >FLASH

  /* used by the startup to initialize data */
  _sidata = LOADADDR(.data);

  /* Initialized data sections goes into RAM, load LMA copy after code */
    .hexbox_rt_code :
    {
        PROVIDE_HIDDEN(hexbox_rt_code__start = .);
        *(.hexbox_rt_code)
        *(.hexbox_rt_code*)
        PROVIDE_HIDDEN(hexbox_rt_code__end = .);
    } >FLASH

	.CODE_REGION_16_ 0x80f8000 :
	{
	_.CODE_REGION_16__start = .;
	*(.CODE_REGION_16_);
	*(.CODE_REGION_16_*);
	_.CODE_REGION_16__end = . ;
	} 

	.CODE_REGION_21_ 0x80f4000 :
	{
	_.CODE_REGION_21__start = .;
	*(.CODE_REGION_21_);
	*(.CODE_REGION_21_*);
	_.CODE_REGION_21__end = . ;
	} 

	.CODE_REGION_19_ 0x80f0000 :
	{
	_.CODE_REGION_19__start = .;
	*(.CODE_REGION_19_);
	*(.CODE_REGION_19_*);
	_.CODE_REGION_19__end = . ;
	} 

	.CODE_REGION_20_ 0x80ee000 :
	{
	_.CODE_REGION_20__start = .;
	*(.CODE_REGION_20_);
	*(.CODE_REGION_20_*);
	_.CODE_REGION_20__end = . ;
	} 

	.CODE_REGION_17_ 0x80ec000 :
	{
	_.CODE_REGION_17__start = .;
	*(.CODE_REGION_17_);
	*(.CODE_REGION_17_*);
	_.CODE_REGION_17__end = . ;
	} 

	.CODE_REGION_10_ 0x80eb000 :
	{
	_.CODE_REGION_10__start = .;
	*(.CODE_REGION_10_);
	*(.CODE_REGION_10_*);
	_.CODE_REGION_10__end = . ;
	} 

	.CODE_REGION_18_ 0x80ea000 :
	{
	_.CODE_REGION_18__start = .;
	*(.CODE_REGION_18_);
	*(.CODE_REGION_18_*);
	_.CODE_REGION_18__end = . ;
	} 

	.CODE_REGION_15_ 0x80e9800 :
	{
	_.CODE_REGION_15__start = .;
	*(.CODE_REGION_15_);
	*(.CODE_REGION_15_*);
	_.CODE_REGION_15__end = . ;
	} 

	.CODE_REGION_13_ 0x80e9000 :
	{
	_.CODE_REGION_13__start = .;
	*(.CODE_REGION_13_);
	*(.CODE_REGION_13_*);
	_.CODE_REGION_13__end = . ;
	} 

	.CODE_REGION_1_ 0x80e8800 :
	{
	_.CODE_REGION_1__start = .;
	*(.CODE_REGION_1_);
	*(.CODE_REGION_1_*);
	_.CODE_REGION_1__end = . ;
	} 

	.CODE_REGION_8_ 0x80e8400 :
	{
	_.CODE_REGION_8__start = .;
	*(.CODE_REGION_8_);
	*(.CODE_REGION_8_*);
	_.CODE_REGION_8__end = . ;
	} 

	.CODE_REGION_0_ 0x80e8000 :
	{
	_.CODE_REGION_0__start = .;
	*(.CODE_REGION_0_);
	*(.CODE_REGION_0_*);
	_.CODE_REGION_0__end = . ;
	} 

	.CODE_REGION_11_ 0x80e7c00 :
	{
	_.CODE_REGION_11__start = .;
	*(.CODE_REGION_11_);
	*(.CODE_REGION_11_*);
	_.CODE_REGION_11__end = . ;
	} 

	.CODE_REGION_2_ 0x80e7a00 :
	{
	_.CODE_REGION_2__start = .;
	*(.CODE_REGION_2_);
	*(.CODE_REGION_2_*);
	_.CODE_REGION_2__end = . ;
	} 

	.CODE_REGION_4_ 0x80e7800 :
	{
	_.CODE_REGION_4__start = .;
	*(.CODE_REGION_4_);
	*(.CODE_REGION_4_*);
	_.CODE_REGION_4__end = . ;
	} 

	.CODE_REGION_7_ 0x80e7600 :
	{
	_.CODE_REGION_7__start = .;
	*(.CODE_REGION_7_);
	*(.CODE_REGION_7_*);
	_.CODE_REGION_7__end = . ;
	} 

	.CODE_REGION_3_ 0x80e7400 :
	{
	_.CODE_REGION_3__start = .;
	*(.CODE_REGION_3_);
	*(.CODE_REGION_3_*);
	_.CODE_REGION_3__end = . ;
	} 

	.CODE_REGION_12_ 0x80e7380 :
	{
	_.CODE_REGION_12__start = .;
	*(.CODE_REGION_12_);
	*(.CODE_REGION_12_*);
	_.CODE_REGION_12__end = . ;
	} 

	.CODE_REGION_14_ 0x80e7300 :
	{
	_.CODE_REGION_14__start = .;
	*(.CODE_REGION_14_);
	*(.CODE_REGION_14_*);
	_.CODE_REGION_14__end = . ;
	} 

	.CODE_REGION_9_ 0x80e7280 :
	{
	_.CODE_REGION_9__start = .;
	*(.CODE_REGION_9_);
	*(.CODE_REGION_9_*);
	_.CODE_REGION_9__end = . ;
	} 

	.CODE_REGION_5_ 0x80e7200 :
	{
	_.CODE_REGION_5__start = .;
	*(.CODE_REGION_5_);
	*(.CODE_REGION_5_*);
	_.CODE_REGION_5__end = . ;
	} 

	.IRQ_CODE_REGION 0x80e7180 :
	{
	_.IRQ_CODE_REGION_start = .;
	*(.IRQ_CODE_REGION);
	*(.IRQ_CODE_REGION*);
	_.IRQ_CODE_REGION_end = . ;
	} 

	.CODE_REGION_6_ 0x80e7140 :
	{
	_.CODE_REGION_6__start = .;
	*(.CODE_REGION_6_);
	*(.CODE_REGION_6_*);
	_.CODE_REGION_6__end = . ;
	} 
  .stack :
  {
    . = . + _Min_Stack_Size - 4; 
    _estack = .;
    . += 4;
  } >RAM

  .data : 
  {
    . = ALIGN(8);
    _sdata = .;        /* create a global symbol at data start */
    *(.data)           /* .data sections */
    *(.data*)          /* .data* sections */

    . = ALIGN(8);
    _edata = .;        /* define a global symbol at data end */
  } >RAM AT> FLASH

  _siccmram = LOADADDR(.ccmram);

  /* CCM-RAM section 
  * 
  * IMPORTANT NOTE! 
  * If initialized variables will be placed in this section,
  * the startup code needs to be modified to copy the init-values.  
  */
  .ccmram :
  {
    . = ALIGN(4);
    _sccmram = .;       /* create a global symbol at ccmram start */
    *(.ccmram)
    *(.ccmram*)
    
    . = ALIGN(4);
    _eccmram = .;       /* create a global symbol at ccmram end */
  } >CCMRAM AT> FLASH

  
  /* Uninitialized data section */
  . = ALIGN(4);
  .bss :
  {
    /* This is used by the startup in order to initialize the .bss secion */
    _sbss = .;         /* define a global symbol at bss start */
    __bss_start__ = _sbss;
    *(.bss)
    *(.bss*)
    *(COMMON)

    . = ALIGN(4);
    _ebss = .;         /* define a global symbol at bss end */
    __bss_end__ = _ebss;
  } >RAM

  /* User_heap_stack section, used to check that there is enough RAM left */
  ._user_heap_stack :
  {
    . = ALIGN(4);
    PROVIDE ( end = . );
    PROVIDE ( _end = . );
    . = . + _Min_Heap_Size;
/*     . = . + _Min_Stack_Size; */
    . = ALIGN(4);
  } >RAM

  

  /* Remove information from the standard libraries */
    .hexbox_rt_ram__vma_start = LOADADDR(.hexbox_rt_ram);
    .hexbox_rt_ram :
    {
    . = ALIGN(4);
    .hexbox_rt_ram__start = .;
    *(.hexbox_rt_ram);
    *(.hexbox_rt_ram*);
    . = ALIGN(4);
    .hexbox_rt_ram__end = .;
    } >RAM AT>FLASH

	.DATA_REGION_3__vma_start = LOADADDR(.DATA_REGION_3__data);
	.DATA_REGION_3__data 0x2001c000 :
	{
	.DATA_REGION_3__data_start = .;
	.DATA_REGION_3__mpu_start = .;
	*(.DATA_REGION_3__data);
	*(.DATA_REGION_3__data*);
	. = ALIGN(4);
	.DATA_REGION_3__data_end = .;
	} AT>FLASH

	.DATA_REGION_3__bss .DATA_REGION_3__data_end :
	{
	.DATA_REGION_3__bss_start = .;
	. = ALIGN(4);
	*(.DATA_REGION_3__bss);
	*(.DATA_REGION_3__bss*);
	. = ALIGN(4);
	.DATA_REGION_3__bss_end = .;
	} 

	.DATA_REGION_13__vma_start = LOADADDR(.DATA_REGION_13__data);
	.DATA_REGION_13__data 0x2001bfe0 :
	{
	.DATA_REGION_13__data_start = .;
	.DATA_REGION_13__mpu_start = .;
	*(.DATA_REGION_13__data);
	*(.DATA_REGION_13__data*);
	. = ALIGN(4);
	.DATA_REGION_13__data_end = .;
	} AT>FLASH

	.DATA_REGION_13__bss .DATA_REGION_13__data_end :
	{
	.DATA_REGION_13__bss_start = .;
	. = ALIGN(4);
	*(.DATA_REGION_13__bss);
	*(.DATA_REGION_13__bss*);
	. = ALIGN(4);
	.DATA_REGION_13__bss_end = .;
	} 

	.DATA_REGION_8__vma_start = LOADADDR(.DATA_REGION_8__data);
	.DATA_REGION_8__data 0x2001bfe0 :
	{
	.DATA_REGION_8__data_start = .;
	.DATA_REGION_8__mpu_start = .;
	*(.DATA_REGION_8__data);
	*(.DATA_REGION_8__data*);
	. = ALIGN(4);
	.DATA_REGION_8__data_end = .;
	} AT>FLASH

	.DATA_REGION_8__bss .DATA_REGION_8__data_end :
	{
	.DATA_REGION_8__bss_start = .;
	. = ALIGN(4);
	*(.DATA_REGION_8__bss);
	*(.DATA_REGION_8__bss*);
	. = ALIGN(4);
	.DATA_REGION_8__bss_end = .;
	} 
  /DISCARD/ :
  {
    libc.a ( * )
    libm.a ( * )
    libgcc.a ( * )
  }

  .ARM.attributes 0 : { *(.ARM.attributes) }
}


