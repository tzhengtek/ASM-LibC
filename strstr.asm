BITS 64
SECTION .text
GLOBAL strstr

strstr:
        PUSH RBP
        MOV RBP, RSP
        XOR RCX, RCX
        XOR RDX, RDX
        XOR R9, R9
        JMP loop

loop:
        ADD RDX, RCX
        CMP BYTE[RDI + RDX], 0
        JE last_check
        XOR RDX, RDX
        JMP check_loop

check_loop:
        MOV R9, RCX
        ADD R9, RDX
        MOV R10B, [RDI + R9]
        CMP BYTE[RSI + RDX], 0
        JE found
        CMP BYTE[RSI + RDX], R10B
        JNE increment
        INC RDX
        JMP check_loop

increment:
        INC RCX
        JMP loop

found:
        ADD RDI, RCX
        MOV RAX, RDI
        LEAVE
        RET

last_check:
        CMP BYTE[RSI], 0
        JE empty
        JMP error

empty:
        MOV RAX, RDI
        LEAVE
        RET

error:
        XOR RAX, RAX
        LEAVE
        RET
