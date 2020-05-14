#ifndef __EMULATOR_H
#define __EMULATOR_H



#include <stdint.h>

/* 
'attribute' tells the compiler that the function is an embedded assembly function.
'section' specifies that a variable must be placed in a particular section. 

copy from FLASH to RAM
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

.hexbox_rt_code :
{
    PROVIDE_HIDDEN(hexbox_rt_code__start = .);
    *(.hexbox_rt_code)
    *(.hexbox_rt_code*)
    PROVIDE_HIDDEN(hexbox_rt_code__end = .);
} >FLASH
*/
#define AT_HEXBOX_DATA __attribute__((section(".hexbox_rt_ram")))
#define AT_HEXBOX_CODE __attribute__((section(".hexbox_rt_code")))

struct reg_frame{
  uint32_t r0;
  uint32_t r1;
  uint32_t r2;
  uint32_t r3;
  uint32_t r4;
  uint32_t r5;
  uint32_t r6;
  uint32_t r7;
  uint32_t r8;
  uint32_t r9;
  uint32_t r10;
  uint32_t r11;
  uint32_t r12;
  uint32_t sp; //r13
  uint32_t lr; //r14
  uint32_t pc; //r15
  uint32_t psr;
};

struct emulator_acl_entry{
  uint32_t start_addr;
  uint32_t end_addr;
};

/* 
'naked' tells the compiler does not generate prologue and epilogue sequences for functions. No entry or exit.
*/
void AT_HEXBOX_CODE __attribute__((naked))__hexbox_emulator_isr() ;

/*
the value of emulate_store function places in flash 
*/
uint8_t AT_HEXBOX_CODE emulate_store(uint32_t inst,uint32_t * Regs, uint32_t comp_id) ;

#endif
