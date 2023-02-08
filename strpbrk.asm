BITS 64
SECTION .text
GLOBAL strpbrk

strpbrk:
        PUSH RBP
        MOV RBP, RSP
        XOR RCX, RCX
        XOR RDX, RDX
        JMP loop

loop:
        XOR RDX, RDX
        MOV R8B, BYTE[RDI + RCX]
        CMP BYTE[RDI + RCX], 0
        JE error
        JMP check_loop

check_loop:
        CMP BYTE[RSI + RDX], 0
        JE increment
        CMP [RSI + RDX], R8B
        JE found
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

error:
        MOV RAX, 0
        LEAVE
        RET
