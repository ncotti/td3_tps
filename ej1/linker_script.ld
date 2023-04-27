OUTPUT_FORMAT("elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(_start)

PROVIDE(_dst_addr   = 0x70030000);
PROVIDE(_stack_addr = 0x70020000);

MEMORY {
    rom     (rx)    :   ORIGIN = 0x70010000, LENGTH = 0x1000
    ram     (wa)    :   ORIGIN = _dst_addr, LENGTH = 0x1000
    stack   (wa)    :   ORIGIN = _stack_addr, LENGTH = 0x1000
}

SECTIONS {
    .init : AT(ORIGIN(rom)) {
        *(.init*)
    } 

    .text : AT(LOADADDR(.init) + SIZEOF(.init)) ALIGN(4) {
        *(.text*)
    } >ram
    PROVIDE(_src_addr = LOADADDR(.text));
    

    .data : ALIGN(4) {
        *(.text*)
    } >ram
    PROVIDE(_size = SIZEOF(.text) + SIZEOF(.data));
} 