BITS 64                                 ; 64-bit mode
SECTION .text                           ; Code section
GLOBAL memcpy                           ; Export 'memcpy'

memcpy:
        PUSH RBP
        MOV RBP, RSP
        XOR RCX, RCX                    ; Init RCX to 0
        JMP loop

loop:
        CMP RDX, RCX
        JE end
        MOV R8B, BYTE[RSI + RCX]
        MOV BYTE[RDI + RCX], R8B
        INC RCX                     ; Increment count
        JMP loop                    ; looping

end:
        MOV RAX, RDI
        LEAVE                           ; Epilogue
        RET                             ; Return
