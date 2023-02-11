BITS 64
SECTION .text
GLOBAL strcasecmp

strcasecmp:
        PUSH RBP
        MOV RBP, RSP
        XOR RCX, RCX                ; Init RCX to 0
        XOR R8, R8
        XOR R9, R9
        JMP loop

loop:
    MOV R8B, BYTE[RDI + RCX]
    MOV R9B, BYTE[RSI + RCX]
    JMP check_upper_first_A

check_compare:
    CMP R8B, R9B
    JNE error
    CMP R8B, 0
    JE check_end
    INC RCX
    JMP loop

check_end:
    CMP R9B, 0
    JE equal
    INC RCX
    JMP loop

check_upper_first_A:
    CMP R8B, 'A'
    JGE check_upper_first_Z
    JMP check_upper_second_A

check_upper_first_Z:
    CMP R8B, 'Z'
    JLE get_lower_first
    JMP check_upper_second_A

get_lower_first:
    ADD R8B, 0x20
    JMP check_upper_second_A

check_upper_second_A:
    CMP R9B, 'A'
    JGE check_upper_second_Z
    JMP check_compare

check_upper_second_Z:
    CMP R9B, 'Z'
    JLE get_lower_second
    JMP check_compare

get_lower_second:
    ADD R9B, 0x20
    JMP check_compare

error:
    SUB R8, R9
    MOV RAX, R8
    LEAVE
    RET

equal:
    XOR RAX, RAX
    LEAVE
    RET