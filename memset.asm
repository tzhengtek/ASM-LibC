BITS 64                                 ; 64-bit mode
SECTION .text                           ; Code section
GLOBAL memset                           ; Export 'memset'

memset:
        PUSH RBP
        MOV RBP, RSP
        XOR RCX, RCX                    ; Init RCX to 0
        JMP loop

loop:
        CMP RDX, RCX
        JE null
        MOV BYTE[RDI + RCX], SIL
        INC RCX                     ; Increment count
        JMP loop

null:
        MOV RAX, RDI
        LEAVE                           ; Epilogue
        RET                             ; Return
