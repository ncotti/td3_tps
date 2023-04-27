OUTPUT_FORMAT("elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(_start)

linker_rom_origin   = 0x70010000;
linker_stack_origin = 0x70020000;
linker_ram_origin   = 0x70030000;

linker_rom_length   = 0x1000;
linker_ram_length   = 0x1000;
linker_stack_length = 0x1000;

MEMORY {
    rom     (rx)    :   ORIGIN = linker_rom_origin,     LENGTH = linker_rom_length
    ram     (wa)    :   ORIGIN = linker_ram_origin,     LENGTH = linker_ram_length
    stack   (wa)    :   ORIGIN = linker_stack_origin,   LENGTH = linker_stack_length
}

SECTIONS {
    .init : {
        *(.init*)
    } >rom AT>rom

    .text : ALIGN(4) {
        *(.text*)
    } >ram AT>rom
    PROVIDE(linker_text_section_lma = LOADADDR(.text));
    PROVIDE(linker_text_section_vma = ADDR(.text));
    PROVIDE(linker_text_section_size = SIZEOF(.text));

    .data : ALIGN(4) {
        *(.text*)
    } >ram AT>rom
    PROVIDE(linker_data_section_lma = LOADADDR(.data));
    PROVIDE(linker_data_section_vma = ADDR(.data));
    PROVIDE(linker_data_section_size = SIZEOF(.data));
    
} 