BITS 64                                 ; 64-bit mode
SECTION .text                           ; Code section
GLOBAL memcpy                           ; Export 'memcpy'

memcpy:
        PUSH RBP                        ; Enter
        MOV RBP, RSP
        XOR RCX, RCX                    ; Init RCX to 0
        JMP loop                        ; Enter loop

loop:
        CMP RDX, RCX                    ; Check if nb bytes is reached
        JE end                          ; Jump to end
        MOV R8B, BYTE[RSI + RCX]        ; Move Src n byte in a register
        MOV BYTE[RDI + RCX], R8B        ; Move register to Dest
        INC RCX                         ; Increment count
        JMP loop                        ; looping

end:
        MOV RAX, RDI                    ; Register return : modified Dest
        LEAVE                           ; Epilogue
        RET                             ; Return
