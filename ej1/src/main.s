.global _start

.extern linker_stack_origin
.extern linker_text_section_lma, linker_text_section_vma, linker_text_section_size
.extern linker_data_section_origin, linker_data_section_vma, linker_data_section_size
.extern memcopy

.section .init
_start:
    ldr sp, =linker_stack_origin            // Initialice stack pointer
    
    ldr r0, =linker_text_section_vma        // Load memcopy args
    ldr r1, =linker_text_section_lma
    ldr r2, =linker_text_section_size
    bl memcopy

    ldr r0, =linker_data_section_vma
    ldr r1, =linker_data_section_lma
    ldr r2, =linker_data_section_size
    bl memcopy
 
    b end

.text
end:        // Actual code
    nop
    nop
    nop

.data
str: .string "Hola mundo"
