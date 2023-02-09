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
            MOV R8B, [RDI + RCX]
            MOV R9B, [RSI + RCX]
            CMP RDX, RCX
            JE equal
            CMP R8B, 0
            JE last_check
            CMP R9B, 0
            JE last_check
            CMP R8B, R9B
            JNE error
            INC RCX
            JMP loop

last_check:
    CMP R8B, R9B
    JNE error
    JE equal

equal:
    MOV RAX, 0
    LEAVE
    RET

error:
    SUB R8, R9
    MOV RAX, R8
    LEAVE
    RET
