BITS 64
SECTION .text
GLOBAL strncmp

strncmp:
        PUSH RBP
        MOV RBP, RSP
        XOR RCX, RCX                ; Init RCX to 0
        XOR R8, R8
        XOR R9, R9
        loop:
            CMP RDX, RCX
            JE equal
            CMP BYTE[RDI + RCX], 0
            JE equal
            MOV R8B, BYTE[RDI + RCX]
            MOV R9B, BYTE[RSI + RCX]
            CMP R8B, R9B
            JNE error
            INC RCX
            JMP loop
equal:
    MOV RAX, 0
    LEAVE
    RET

error:
    SUB R8, R9
    MOV RAX, R8
    LEAVE
    RET
