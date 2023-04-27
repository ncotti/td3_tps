.global main

.text
main:
    ldr r0, =str 
    ldrb r1, [r0, #8]  
    b end

end:
    // End processor execution
    nop

.data
str: .string "Hola mundo"
