BITS 64                                 ; 64-bit mode
SECTION .text                           ; Code section
GLOBAL memmove                           ; Export 'memmove'

memmove:
        PUSH RBP
        MOV RBP, RSP
        XOR RCX, RCX                    ; Init RCX to 0
        MOV R8, RDX
        JMP stack_loop

stack_loop:
        MOV R9B, [RSI + R8]
        PUSH R9
        CMP R8, 0
        JE loop
        DEC R8
        JMP stack_loop

loop:
        CMP RDX, RCX
        JE end
        POP R10
        MOV BYTE[RDI + RCX], R10B
        INC RCX                     ; Increment count
        JMP loop                    ; looping

end:
        MOV RAX, RDI
        LEAVE                           ; Epilogue
        RET                             ; Return
