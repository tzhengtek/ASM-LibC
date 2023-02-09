BITS 64
SECTION .text
GLOBAL strcspn

strcspn:
        PUSH RBP
        MOV RBP, RSP
        XOR RCX, RCX
        XOR RDX, RDX
        JMP loop

loop:
        XOR RDX, RDX
        MOV R8B, BYTE[RDI + RCX]
        CMP BYTE[RDI + RCX], 0
        JE end
        JMP check_loop

check_loop:
        CMP BYTE[RSI + RDX], 0
        JE increment
        CMP [RSI + RDX], R8B
        JE end
        INC RDX
        JMP check_loop

increment:
        INC RCX
        JMP loop

end:
        MOV RAX, RCX
        LEAVE
        RET
