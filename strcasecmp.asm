BITS 64
SECTION .text
GLOBAL strcasecmp

strcasecmp:
        PUSH RBP
        MOV RBP, RSP
        XOR RCX, RCX                ; Init RCX to 0
        XOR R8, R8
        XOR R9, R9
        loop:
            CMP BYTE[RDI + RCX], 0
            JE equal
            MOV R8B, BYTE[RDI + RCX]
            MOV R9B, BYTE[RSI + RCX]
            CMP R8B, R9B
            JNE check_case
            INC RCX
            JMP loop

check_case:
        XOR R10B, R8B
        CMP R10B, R9B
        JL check_upper_case
        JG check_lower_case

check_lower_case:
        XOR R10B, R8B
        SUB R10B, 0x20
        CMP R10B, R9B
        JNE get_lower_char
        INC RCX
        JMP loop

check_upper_case:
        XOR R10B, R8B
        ADD R10B, 0x20
        CMP R10B, R9B
        JNE get_uppper_char
        INC RCX
        JMP loop

get_lower_char:
    MOV R10B, R9B
    SUB R10B, R8B
    CMP R10B, -25
    JGE error
    ADD R9B, 0x20
    JMP error

get_uppper_char:
    MOV R10B, R8B
    SUB R10B, R9B
    CMP R10B, -25
    JGE error
    ADD R8B, 0x20
    JMP error

error:
    SUB R8, R9
    MOV RAX, R8
    LEAVE
    RET

equal:
    MOV RAX, 0
    LEAVE
    RET