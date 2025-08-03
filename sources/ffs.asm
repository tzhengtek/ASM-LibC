BITS 64                         ; 64-bit mode
SECTION .text                   ; Code section
GLOBAL ffs                      ; Export 'ffs'

ffs:
    PUSH RBP
    MOV RBP, RSP
    BSF RAX, RDI
    JE null
    INC RAX
    LEAVE
    RET

null:
    MOV RAX, 0
    LEAVE
    RET