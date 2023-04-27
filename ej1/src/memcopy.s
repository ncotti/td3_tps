/*-----------------------------------------------------------------------------
*   @Brief:
*       Copy a block of memory from a source address to a destination address,
*       given the number of bytes to copy.
*
*   @Args:
*       - dst (r0): Destination address. 
*       - src (r1): Source address.
*       - size (r2): Number of bytes of the memory block to copy.
*
*   @Return:
*       Void
-----------------------------------------------------------------------------*/
.global _start

// Variables
dst .req r0
src .req r1
size .req r2
buffer .req r4

// Constants
.extern _text_dst_addr, _text_src_addr, _text_size, _stack_addr, main

.section .init
_start:
    ldr sp, =_stack_addr
    ldr size, =_size
    ldr dst, =_dst_addr
    ldr src, =_src_addr
    loop:       // Copy each byte into memory
        ldrb buffer, [src], #1
        strb buffer, [dst], #1
        subs size, size, #1
        bne loop
    nop
    b main

.unreq dst
.unreq src
.unreq size
.unreq buffer