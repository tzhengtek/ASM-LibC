BITS 64                                 ; 64-bit mode
SECTION .text                           ; Code section
GLOBAL memmove                           ; Export 'memmove'

memmove:
        PUSH RBP
        MOV RBP, RSP
        XOR RCX, RCX                    ; Init RCX to 0
        MOV R9, RSI
        JMP loop

loop:
        CMP RDX, RCX
        JE end
        MOV R8B, BYTE[R9 + RCX]
        MOV BYTE[RDI + RCX], R8B
        INC RCX                     ; Increment count
        JMP loop                    ; looping

end:
        MOV RAX, RDI
        LEAVE                           ; Epilogue
        RET                             ; Return
