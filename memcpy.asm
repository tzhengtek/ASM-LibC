BITS 64                                 ; 64-bit mode
SECTION .text                           ; Code section
GLOBAL memcpy                           ; Export 'memcpy'

memcpy:
        PUSH RBP
        MOV RBP, RSP
        XOR RCX, RCX                    ; Init RCX to 0
        MOV R9, RDI
        JMP loop

loop:
        CMP BYTE[RDI + RCX], 0
        JE end
        CMP RDX, RCX
        JE end
        MOV R8B, BYTE[RSI + RCX]
        MOV BYTE[R9 + RCX], R8B
        INC RCX                     ; Increment count
        JMP loop                    ; looping

end:
        MOV RAX, R9
        LEAVE                           ; Epilogue
        RET                             ; Return
